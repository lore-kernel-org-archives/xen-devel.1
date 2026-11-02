Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D129D606A338
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 19:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SmetYzaB
Received: from list by lists.xenproject.org with outflank-mailman.1468618.1677785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNxI0-00037V-0a; Mon, 02 Nov 2026 19:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468618.1677785; Mon, 02 Nov 2026 19:01:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNxHz-00035i-JO; Mon, 02 Nov 2026 19:01:51 +0000
Received: by outflank-mailman (input) for mailman id 1468618;
 Mon, 02 Nov 2026 19:01:49 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefanha@redhat.com>) id 1xNxHx-0002hT-7e
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 19:01:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNxHw-00AdPD-Jw
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 20:01:48 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefanha@redhat.com>)
 id 6ae8de0c-8faa-0a2a0a5109dd-0a2a4503a4a8-44
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 20:01:48 +0100
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefanha@redhat.com>)
 id 6ae8de1b-fae8-0a2a45030019-aa0a857c6055-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 20:01:48 +0100
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-646-61Hjws2NNHCoyIqTnsAHig-1; Mon,
 02 Nov 2026 14:01:42 -0500
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 65FD3195422F; Mon,  2 Nov 2026 19:01:40 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 174F81955F73; Mon,  2 Nov 2026 19:01:39 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793646107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LGa+HMdMyZp+fDqANZnP8jW3DD1gu9BvhH368Mvy95o=;
	b=SmetYzaBVH+Es45FhL8vZaYW+xP9Gvl6aqobJXm6oNkZdmgULwKY7cdvf0cBcghPlOZNpx
	NfaGUhCSW7dZiqtXM5YEgUCfIdzSC6bB8QTNO/c/n/KRlg/IfZoyHWdoe7w9tsjDr1lUut
	5CjxlZX7rkuzajNIBmakJPE6vlV70Zc=
X-MC-Unique: 61Hjws2NNHCoyIqTnsAHig-1
X-Mimecast-MFC-AGG-ID: 61Hjws2NNHCoyIqTnsAHig_1793646101
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Helge Deller <deller@gmx.de>,
	xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony@xenproject.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 15/25] trace: add missing newline in ftrace Rust format string
Date: Mon,  2 Nov 2026 13:58:21 -0500
Message-ID: <20261102185831.1880189-16-stefanha@redhat.com>
In-Reply-To: <20261102185831.1880189-1-stefanha@redhat.com>
References: <20261102185831.1880189-1-stefanha@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: kRRiJvWyy3jm7ydQmUrayzYbmEn6OZI8JXzF2WjbSlM_1793646101
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1793646108-74A894E9-34CEEF0E/35/111497
X-purgate-type: clean
X-purgate-size: 3936
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Daniel P. Berrangé <berrange@redhat.com>

The ftrace_write() method expects the caller to provide the
newline.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20261102142844.3464712-16-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 scripts/tracetool/backend/ftrace.py | 2 +-
 tests/tracetool/all.rs              | 4 ++--
 tests/tracetool/ftrace.rs           | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/tracetool/backend/ftrace.py b/scripts/tracetool/backend/ftrace.py
index ba2a0c83770..e304ef21999 100644
--- a/scripts/tracetool/backend/ftrace.py
+++ b/scripts/tracetool/backend/ftrace.py
@@ -45,7 +45,7 @@ def generate_h_backend_dstate(event, group):
         event_id="TRACE_" + event.name.upper())
 
 def generate_rs(event, group):
-    out('        let format_string = c"%(fmt)s";',
+    out('        let format_string = c"%(fmt)s\\n";',
         '        unsafe {bindings::ftrace_write(format_string.as_ptr() as *const c_char, %(args)s);}',
         fmt=expand_format_string(event.fmt, event.name + " "),
         args=event.args.rust_call_varargs())
diff --git a/tests/tracetool/all.rs b/tests/tracetool/all.rs
index 14afd86281e..f48bdf4aab5 100644
--- a/tests/tracetool/all.rs
+++ b/tests/tracetool/all.rs
@@ -47,7 +47,7 @@ pub fn trace_test_blah(_context: *mut (), _filename: &std::ffi::CStr)
 {
     ::trace::probe!(qemu, test_blah, _context, _filename.as_ptr());
     if trace_event_state_is_enabled(unsafe { _TRACE_TEST_BLAH_DSTATE}) {
-        let format_string = c"test_blah Blah context=%p filename=%s";
+        let format_string = c"test_blah Blah context=%p filename=%s\n";
         unsafe {bindings::ftrace_write(format_string.as_ptr() as *const c_char, _context /* as *mut () */, _filename.as_ptr());}
         let format_string = c"test_blah Blah context=%p filename=%s\n";
         if (unsafe { bindings::qemu_loglevel } & bindings::LOG_TRACE) != 0 {
@@ -75,7 +75,7 @@ pub fn trace_test_wibble(_context: *mut (), _value: std::ffi::c_int)
 {
     ::trace::probe!(qemu, test_wibble, _context, _value);
     if trace_event_state_is_enabled(unsafe { _TRACE_TEST_WIBBLE_DSTATE}) {
-        let format_string = c"test_wibble Wibble context=%p value=%d";
+        let format_string = c"test_wibble Wibble context=%p value=%d\n";
         unsafe {bindings::ftrace_write(format_string.as_ptr() as *const c_char, _context /* as *mut () */, _value /* as std::ffi::c_int */);}
         let format_string = c"test_wibble Wibble context=%p value=%d\n";
         if (unsafe { bindings::qemu_loglevel } & bindings::LOG_TRACE) != 0 {
diff --git a/tests/tracetool/ftrace.rs b/tests/tracetool/ftrace.rs
index 39959d3fdd1..1ad13172b17 100644
--- a/tests/tracetool/ftrace.rs
+++ b/tests/tracetool/ftrace.rs
@@ -36,7 +36,7 @@ pub fn trace_test_blah_enabled() -> bool
 pub fn trace_test_blah(_context: *mut (), _filename: &std::ffi::CStr)
 {
     if trace_event_state_is_enabled(unsafe { _TRACE_TEST_BLAH_DSTATE}) {
-        let format_string = c"test_blah Blah context=%p filename=%s";
+        let format_string = c"test_blah Blah context=%p filename=%s\n";
         unsafe {bindings::ftrace_write(format_string.as_ptr() as *const c_char, _context /* as *mut () */, _filename.as_ptr());}
     }
 }
@@ -54,7 +54,7 @@ pub fn trace_test_wibble_enabled() -> bool
 pub fn trace_test_wibble(_context: *mut (), _value: std::ffi::c_int)
 {
     if trace_event_state_is_enabled(unsafe { _TRACE_TEST_WIBBLE_DSTATE}) {
-        let format_string = c"test_wibble Wibble context=%p value=%d";
+        let format_string = c"test_wibble Wibble context=%p value=%d\n";
         unsafe {bindings::ftrace_write(format_string.as_ptr() as *const c_char, _context /* as *mut () */, _value /* as std::ffi::c_int */);}
     }
 }
-- 
2.56.0


