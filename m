Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E03606A327
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 19:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GhAIcJxS
Received: from list by lists.xenproject.org with outflank-mailman.1468597.1677737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNxHp-00019o-26; Mon, 02 Nov 2026 19:01:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468597.1677737; Mon, 02 Nov 2026 19:01:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNxHo-00018y-Oj; Mon, 02 Nov 2026 19:01:40 +0000
Received: by outflank-mailman (input) for mailman id 1468597;
 Mon, 02 Nov 2026 19:01:39 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefanha@redhat.com>) id 1xNxHn-0000kT-2I
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 19:01:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNxHm-00AdPD-FM
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 20:01:38 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefanha@redhat.com>)
 id 6ae8de10-8faa-0a2a0a5109dd-0a2a4504ac8c-10
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 20:01:38 +0100
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefanha@redhat.com>)
 id 6ae8de11-b57f-0a2a45040019-aa0a857ce263-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 20:01:38 +0100
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-692-qHh40kBpP820t_m4fj_mMA-1; Mon,
 02 Nov 2026 14:01:33 -0500
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7FBBE180ACFD; Mon,  2 Nov 2026 19:01:31 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8E0CD1955F43; Mon,  2 Nov 2026 19:01:30 +0000 (UTC)
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
	s=mimecast20190719; t=1793646097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DlKbUaAjj04ta+A1/nUMfLg/CAVRg3igZyolJR7CeYY=;
	b=GhAIcJxS+QusmjgjbND2DOjVnFMmKHKC6MX2IOKJ1bB/21JXFC9kbLQ8KBKTWDtvE6ozZN
	g3bxfejIzJUhGyUw4Zn+q9xdpWQZXjh9IivPbYTbqVBtjS/W3FMRXcXTAD7usiFY8dQA1s
	iFrdB4Dxv6p3LFEeznUgNbnX2R++SoU=
X-MC-Unique: qHh40kBpP820t_m4fj_mMA-1
X-Mimecast-MFC-AGG-ID: qHh40kBpP820t_m4fj_mMA_1793646091
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
Subject: [PULL 14/25] trace: include probe name in Rust format strings
Date: Mon,  2 Nov 2026 13:58:20 -0500
Message-ID: <20261102185831.1880189-15-stefanha@redhat.com>
In-Reply-To: <20261102185831.1880189-1-stefanha@redhat.com>
References: <20261102185831.1880189-1-stefanha@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: eMYoCJL4Mwe_dz_Hb6Gg522P8Aor-fdx60dnOIkh2bA_1793646091
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1793646098-532CCB50-61CE4CF7/35/111497
X-purgate-type: clean
X-purgate-size: 6988
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Daniel P. Berrangé <berrange@redhat.com>

The C format strings all include the probe name as a prefix,
however, this was missed in the Rust generators for ftrace
and syslog.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20261102142844.3464712-15-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 scripts/tracetool/backend/ftrace.py | 2 +-
 scripts/tracetool/backend/syslog.py | 2 +-
 tests/tracetool/all.rs              | 8 ++++----
 tests/tracetool/ftrace.rs           | 4 ++--
 tests/tracetool/syslog.rs           | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/scripts/tracetool/backend/ftrace.py b/scripts/tracetool/backend/ftrace.py
index e03698a2edf..ba2a0c83770 100644
--- a/scripts/tracetool/backend/ftrace.py
+++ b/scripts/tracetool/backend/ftrace.py
@@ -47,5 +47,5 @@ def generate_h_backend_dstate(event, group):
 def generate_rs(event, group):
     out('        let format_string = c"%(fmt)s";',
         '        unsafe {bindings::ftrace_write(format_string.as_ptr() as *const c_char, %(args)s);}',
-        fmt=expand_format_string(event.fmt),
+        fmt=expand_format_string(event.fmt, event.name + " "),
         args=event.args.rust_call_varargs())
diff --git a/scripts/tracetool/backend/syslog.py b/scripts/tracetool/backend/syslog.py
index 12b826593db..746efd35fb9 100644
--- a/scripts/tracetool/backend/syslog.py
+++ b/scripts/tracetool/backend/syslog.py
@@ -41,7 +41,7 @@ def generate_h(event, group):
 def generate_rs(event, group):
     out('        let format_string = c"%(fmt)s";',
         '        unsafe {::trace::syslog(::trace::LOG_INFO, format_string.as_ptr() as *const c_char, %(args)s);}',
-        fmt=expand_format_string(event.fmt),
+        fmt=expand_format_string(event.fmt, event.name + " "),
         args=event.args.rust_call_varargs())
 
 def generate_h_backend_dstate(event, group):
diff --git a/tests/tracetool/all.rs b/tests/tracetool/all.rs
index c8c9d288366..14afd86281e 100644
--- a/tests/tracetool/all.rs
+++ b/tests/tracetool/all.rs
@@ -47,7 +47,7 @@ pub fn trace_test_blah(_context: *mut (), _filename: &std::ffi::CStr)
 {
     ::trace::probe!(qemu, test_blah, _context, _filename.as_ptr());
     if trace_event_state_is_enabled(unsafe { _TRACE_TEST_BLAH_DSTATE}) {
-        let format_string = c"Blah context=%p filename=%s";
+        let format_string = c"test_blah Blah context=%p filename=%s";
         unsafe {bindings::ftrace_write(format_string.as_ptr() as *const c_char, _context /* as *mut () */, _filename.as_ptr());}
         let format_string = c"test_blah Blah context=%p filename=%s\n";
         if (unsafe { bindings::qemu_loglevel } & bindings::LOG_TRACE) != 0 {
@@ -55,7 +55,7 @@ pub fn trace_test_blah(_context: *mut (), _filename: &std::ffi::CStr)
         }
         extern "C" { fn _simple_trace_test_blah(_context: *mut (), _filename: *const std::ffi::c_char); }
         unsafe { _simple_trace_test_blah(_context, _filename.as_ptr()); }
-        let format_string = c"Blah context=%p filename=%s";
+        let format_string = c"test_blah Blah context=%p filename=%s";
         unsafe {::trace::syslog(::trace::LOG_INFO, format_string.as_ptr() as *const c_char, _context /* as *mut () */, _filename.as_ptr());}
     }
 }
@@ -75,7 +75,7 @@ pub fn trace_test_wibble(_context: *mut (), _value: std::ffi::c_int)
 {
     ::trace::probe!(qemu, test_wibble, _context, _value);
     if trace_event_state_is_enabled(unsafe { _TRACE_TEST_WIBBLE_DSTATE}) {
-        let format_string = c"Wibble context=%p value=%d";
+        let format_string = c"test_wibble Wibble context=%p value=%d";
         unsafe {bindings::ftrace_write(format_string.as_ptr() as *const c_char, _context /* as *mut () */, _value /* as std::ffi::c_int */);}
         let format_string = c"test_wibble Wibble context=%p value=%d\n";
         if (unsafe { bindings::qemu_loglevel } & bindings::LOG_TRACE) != 0 {
@@ -83,7 +83,7 @@ pub fn trace_test_wibble(_context: *mut (), _value: std::ffi::c_int)
         }
         extern "C" { fn _simple_trace_test_wibble(_context: *mut (), _value: std::ffi::c_int); }
         unsafe { _simple_trace_test_wibble(_context, _value); }
-        let format_string = c"Wibble context=%p value=%d";
+        let format_string = c"test_wibble Wibble context=%p value=%d";
         unsafe {::trace::syslog(::trace::LOG_INFO, format_string.as_ptr() as *const c_char, _context /* as *mut () */, _value /* as std::ffi::c_int */);}
     }
 }
diff --git a/tests/tracetool/ftrace.rs b/tests/tracetool/ftrace.rs
index ff0bcde4b8b..39959d3fdd1 100644
--- a/tests/tracetool/ftrace.rs
+++ b/tests/tracetool/ftrace.rs
@@ -36,7 +36,7 @@ pub fn trace_test_blah_enabled() -> bool
 pub fn trace_test_blah(_context: *mut (), _filename: &std::ffi::CStr)
 {
     if trace_event_state_is_enabled(unsafe { _TRACE_TEST_BLAH_DSTATE}) {
-        let format_string = c"Blah context=%p filename=%s";
+        let format_string = c"test_blah Blah context=%p filename=%s";
         unsafe {bindings::ftrace_write(format_string.as_ptr() as *const c_char, _context /* as *mut () */, _filename.as_ptr());}
     }
 }
@@ -54,7 +54,7 @@ pub fn trace_test_wibble_enabled() -> bool
 pub fn trace_test_wibble(_context: *mut (), _value: std::ffi::c_int)
 {
     if trace_event_state_is_enabled(unsafe { _TRACE_TEST_WIBBLE_DSTATE}) {
-        let format_string = c"Wibble context=%p value=%d";
+        let format_string = c"test_wibble Wibble context=%p value=%d";
         unsafe {bindings::ftrace_write(format_string.as_ptr() as *const c_char, _context /* as *mut () */, _value /* as std::ffi::c_int */);}
     }
 }
diff --git a/tests/tracetool/syslog.rs b/tests/tracetool/syslog.rs
index 9688dac84a5..b90ad4be7f4 100644
--- a/tests/tracetool/syslog.rs
+++ b/tests/tracetool/syslog.rs
@@ -36,7 +36,7 @@ pub fn trace_test_blah_enabled() -> bool
 pub fn trace_test_blah(_context: *mut (), _filename: &std::ffi::CStr)
 {
     if trace_event_state_is_enabled(unsafe { _TRACE_TEST_BLAH_DSTATE}) {
-        let format_string = c"Blah context=%p filename=%s";
+        let format_string = c"test_blah Blah context=%p filename=%s";
         unsafe {::trace::syslog(::trace::LOG_INFO, format_string.as_ptr() as *const c_char, _context /* as *mut () */, _filename.as_ptr());}
     }
 }
@@ -54,7 +54,7 @@ pub fn trace_test_wibble_enabled() -> bool
 pub fn trace_test_wibble(_context: *mut (), _value: std::ffi::c_int)
 {
     if trace_event_state_is_enabled(unsafe { _TRACE_TEST_WIBBLE_DSTATE}) {
-        let format_string = c"Wibble context=%p value=%d";
+        let format_string = c"test_wibble Wibble context=%p value=%d";
         unsafe {::trace::syslog(::trace::LOG_INFO, format_string.as_ptr() as *const c_char, _context /* as *mut () */, _value /* as std::ffi::c_int */);}
     }
 }
-- 
2.56.0


