From: Ben Clewett <ben.clewett@roadtech.co.uk>
Subject: Xen and Inter-VM-Communications
Date: Fri, 23 Nov 2018 11:57:10 +0000
Message-ID: <ab737a9c-b8be-f194-b5ce-976a4d6e2eba@roadtech.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7766116201258551850=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7ctj=OC=roadtech.co.uk=ben.clewett@srs-us1.protection.inumbo.net>)
 id 1gQA5H-0007by-Bc
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 11:57:19 +0000
Received: from imsva.roadtech.co.uk (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CD218C051
 for <xen-devel@lists.xenproject.org>; Fri, 23 Nov 2018 11:57:15 +0000 (GMT)
Received: from smtp.roadtech.co.uk (unknown [195.245.100.39])
 by imsva.roadtech.co.uk (Postfix) with ESMTPS id 882EC8C03F
 for <xen-devel@lists.xenproject.org>; Fri, 23 Nov 2018 11:57:15 +0000 (GMT)
Received: from [172.16.24.219] (prog-benc-laptop4.roadtech.private
 [172.16.24.219])
 by smtp.roadtech.co.uk (8.14.4/8.14.4) with ESMTP id wANBvCbk005425
 for <xen-devel@lists.xenproject.org>; Fri, 23 Nov 2018 11:57:13 GMT
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============7766116201258551850==
Content-Type: text/html; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body text="#666666" bgcolor="#FFFFFF">
    Hi Guys,<br>
    <br>
    I am interested in using Inter-VM-Communications (IVMC) to enhance
    performance between TCP server/applications running on the same
    Hypervisor.<br>
    <br>
    For instance, XenLoop seems like the magic silver bullet to solve
    our requirements.<br>
    <br>
    Can I please ask what the opinion of developers are?  What IVMC do
    you recommend?  Have you any experience with XenLoop?<br>
    <br>
    Thanks!<br>
    <br>
    Ben<br>
    <br>
    <br>
    <div class="moz-signature">-- <br>
      <p><span
          style="font-size:12.0pt;color:#1F497D;mso-fareast-language:EN-GB"><b>Ben
            Clewett</b></span></p>
      <p><img src="https://www.roadtech.co.uk/assets/rt-logo.png"><br>
      </p>
      <span
        style="font-size:10.0pt;color:#000000;mso-fareast-language:EN-GB"><b>Road
          Tech Computer Systems Ltd</b></span><br>
      <span
        style="font-size:10.0pt;color:#000000;mso-fareast-language:EN-GB"><a
          href="http://www.roadtech.co.uk">www.roadtech.co.uk</a></span><br>
      <span
        style="font-size:10.0pt;color:#000000;mso-fareast-language:EN-GB"><a
          href="http://www.tachomaster.co.uk">www.tachomaster.co.uk</a></span><br>
      <span
        style="font-size:10.0pt;color:#000000;mso-fareast-language:EN-GB"><a
          href="http://www.falcontracking.co.uk">www.falcontracking.co.uk</a></span><br>
      <span
        style="font-size:10.0pt;color:#000000;mso-fareast-language:EN-GB"><a
          href="http://www.predrive.co.uk">www.predrive.co.uk</a></span><br>
      <span
        style="font-size:10.0pt;color:#000000;mso-fareast-language:EN-GB"><a
          href="http://www.roadrunnerlive.co.uk">www.roadrunnerlive.co.uk</a></span><br>
      <span
        style="font-size:10.0pt;color:#000000;mso-fareast-language:EN-GB">Shenley
        Hall</span><br>
      <span
        style="font-size:10.0pt;color:#000000;mso-fareast-language:EN-GB">Rectory
        Lane</span><br>
      <span
        style="font-size:10.0pt;color:#000000;mso-fareast-language:EN-GB">Shenley</span><br>
      <span
        style="font-size:10.0pt;color:#000000;mso-fareast-language:EN-GB">Hertfordshire
        WD7 9AN</span><br>
      <span
        style="font-size:10.0pt;color:#000000;mso-fareast-language:EN-GB">United
        Kingdom</span><br>
      <span
        style="font-size:10.0pt;color:#000000;mso-fareast-language:EN-GB">+44
        (0)1923 460000</span><br>
      <br>
      <span
        style="font-size:8.0pt;color:#000000;mso-fareast-language:EN-GB">Road
        Tech Computer Systems Ltd is a company registered in England and
        Wales. Registered number: 2017435. Registered office: c/o
        Hillier Hopkins, Radius House, 51 Clarendon Road, WATFORD, WD17
        1HP</span><br>
    </div>
  </body>
</html>


--===============7766116201258551850==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7766116201258551850==--
