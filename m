Return-Path: <SRS0=/Lw+=GL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4300C433DB
	for <xen-devel@archiver.kernel.org>; Fri,  8 Jan 2021 14:51:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09BB72388B
	for <xen-devel@archiver.kernel.org>; Fri,  8 Jan 2021 14:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09BB72388B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.63556.112832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxt6k-0000CX-Jl; Fri, 08 Jan 2021 14:51:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63556.112832; Fri, 08 Jan 2021 14:51:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxt6k-0000CO-Ew; Fri, 08 Jan 2021 14:51:18 +0000
Received: by outflank-mailman (input) for mailman id 63556;
 Fri, 08 Jan 2021 14:51:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4H91=GL=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kxt6i-00006L-JP
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 14:51:16 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.23])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b015665a-c694-4453-822a-ec1f8ed2851e;
 Fri, 08 Jan 2021 14:51:13 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
 with ESMTPSA id h0968ex08Ep4D2S
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 8 Jan 2021 15:51:04 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: b015665a-c694-4453-822a-ec1f8ed2851e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610117472;
	s=strato-dkim-0002; d=aepfle.de;
	h=Message-Id:Date:Subject:Cc:To:From:From:Subject:Sender;
	bh=WwDDnhse8CduXneDRBL6YsHp+XW3yq2GXbQKQDe3Eoo=;
	b=VeNEr0QxIkfDkRXWeQHsNDgQFCoKT4zwZaBCoo5543SlJ+6DAkg/Y0lNSUkRqFh4zN
	r0F2ZAWXwWPknieNNmhIAa+FZZ8bp5S+TGbYQGpIOR96Ez5ILKqKgCL1hgh2MiHmZsyC
	2QSVaZHHpBjHoRvs0YIZZq5Gpi7xci6RW9IC1TrEiIO2LHq+e39934abp6ugmAHfysGx
	6+jqhuBfe7UcMldn7e0Yzg7CHBEEpBXeo3Uj//i3uADcdWejtWzXWG8CnHkHf9Iq5rBm
	eBfGJTVcwwAqXcgOd5RBTEvH8Qc6ogh37vwH0mAwgG86d63/s/1xVeSYogOUUKSDDFNR
	CHlg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3Gwg"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1] tools: remove tabs from code produced by libxl_save_msgs_gen.pl
Date: Fri,  8 Jan 2021 15:51:01 +0100
Message-Id: <20210108145101.4439-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/light/libxl_save_msgs_gen.pl | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/libs/light/libxl_save_msgs_gen.pl b/tools/libs/light/libxl_save_msgs_gen.pl
index 5bfbd4fd10..9d425b1dee 100755
--- a/tools/libs/light/libxl_save_msgs_gen.pl
+++ b/tools/libs/light/libxl_save_msgs_gen.pl
@@ -120,8 +120,8 @@ sub typeid ($) { my ($t) = @_; $t =~ s/\W/_/; return $t; };
 
 $out_body{'callout'} .= <<END;
 static int bytes_get(const unsigned char **msg,
-		     const unsigned char *const endmsg,
-		     void *result, int rlen)
+                     const unsigned char *const endmsg,
+                     void *result, int rlen)
 {
     if (endmsg - *msg < rlen) return 0;
     memcpy(result, *msg, rlen);
@@ -132,11 +132,11 @@ static int bytes_get(const unsigned char **msg,
 END
 $out_body{'helper'} .= <<END;
 static void bytes_put(unsigned char *const buf, int *len,
-		      const void *value, int vlen)
+                      const void *value, int vlen)
 {
     assert(vlen < INT_MAX/2 - *len);
     if (buf)
-	memcpy(buf + *len, value, vlen);
+        memcpy(buf + *len, value, vlen);
     *len += vlen;
 }
 
@@ -155,7 +155,7 @@ static int ${typeid}_get(const unsigned char **msg,
 END
     $out_body{'helper'} .= <<END;
 static void ${typeid}_put(unsigned char *const buf, int *len,
-			 const $simpletype value)
+                          const $simpletype value)
 {
     bytes_put(buf, len, &value, sizeof(value));
 }
@@ -192,15 +192,15 @@ END
 $out_body{'helper'} .= <<END;
 static void BLOCK_put(unsigned char *const buf,
                       int *len,
-		      const uint8_t *bytes, uint32_t size)
+                      const uint8_t *bytes, uint32_t size)
 {
     uint32_t_put(buf, len, size);
     bytes_put(buf, len, bytes, size);
 }
 
 static void STRING_put(unsigned char *const buf,
-		       int *len,
-		       const char *string)
+                       int *len,
+                       const char *string)
 {
     size_t slen = strlen(string);
     assert(slen < INT_MAX / 4);
@@ -216,7 +216,7 @@ foreach my $sr (qw(save restore)) {
            "(void *data)");
 
     f_decl("${receiveds}_${sr}", 'callout', 'int',
-	   "(const unsigned char *msg, uint32_t len, void *user)");
+           "(const unsigned char *msg, uint32_t len, void *user)");
 
     f_decl("${enumcallbacks}_${sr}", 'callout', 'unsigned',
            "(const ".cbtype($sr)." *cbs)");
@@ -301,7 +301,7 @@ END_ALWAYS
 	$c_callback_args .= "$c_args, ";
 	$c_recv.=
             "        if (!${typeid}_get(&msg, endmsg, $c_get_args)) return 0;\n";
-        f_more("${encode}_$name", "	${typeid}_put(buf, &len, $c_args);\n");
+        f_more("${encode}_$name", "        ${typeid}_put(buf, &len, $c_args);\n");
     }
     $f_more_sr->($c_recv);
     $c_decl .= "void *user)";

