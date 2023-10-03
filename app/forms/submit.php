<?php
$receivingAddress = 'minhanh.aributera@gmail.com';
$postData = $statusMsg = '';
$msgClass = 'errordiv';
if(isset($_POST['submit'])){
    // Get the submitted form data
    $postData = $_POST;
    $submitter = $_POST['submitter'];
    $pmid = $_POST['pmid'];
    $gene = $_POST['gene'];
    $utrs = $_POST['utrs'];
    $start = $_POST['start'];
    $stop = $_POST['stop'];
    $technique = $_POST['technique'];
    $comments = $_POST['comments'];
     
    // Check whether submitted data is not empty
    if(!empty($submitter) && !empty($pmid) && !empty($gene)){  
        // Subject
        $emailSubject = 'Regulatory Event Data Submitted';
             
        // Message 
        $htmlContent = '
            <p><b>Submitter:</b> '.$submitter.'</p>
            <p><b>PMID/DOI:</b> '.$pmid.'</p>
            <p><b>Gene:</b> '.$gene.'</p>
            <p><b>UTR(s):</b> '.$utrs.'</p>
            <p><b>Binding site start:</b> '.$start.'</p>
            <p><b>Binding site stop:</b> '.$stop.'</p>
            <p><b>Technique:</b> '.$technique.'</p>
            <p><b>Comments:</b> '.$comments.'</p>';
         
        // Header for sender info
        $headers = "From:". $submitter;

        // Set content-type header for sending HTML email
        $headers .= "\r\n". "MIME-Version: 1.0";
        $headers .= "\r\n". "Content-type:text/html;charset=UTF-8";
        
        // Send email
        $mail = mail($receivingAddress, $emailSubject, $htmlContent, $headers); 

        // If mail sent
        if($mail){
            $statusMsg = 'Your Message was submitted successfully!';
            $msgClass = 'succdiv';
             
            $postData = '';
        }else{
            $statusMsg = 'Your contact request submission failed, please try again.';
        }    
        
    }else{
        $statusMsg = 'Please fill all the fields.';
    }
}

?>
