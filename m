From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 02/16] VMX: don't unconditionally set the
 tsc_scaling.setup hook
Date: Wed, 11 Jul 2018 07:23:48 -0600
Message-ID: <5B4604E402000078001D3247@prv1-mh.provo.novell.com>
References: <5B46030502000078001D322E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=t1xz=j3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fdF5y-00072h-V3
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 13:23:50 +0000
In-Reply-To: <5B46030502000078001D322E@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

SW5zdGVhZCBvZiBjaGVja2luZyBodm1fdHNjX3NjYWxpbmdfc3VwcG9ydGVkIGluc2lkZSB0aGUg
aG9vayBmdW5jdGlvbiwKaW5zdGFsbCB0aGUgaG9vayBvbmx5IHdoZW4gc2V0dGluZyBzdGF0ZSBz
dWNoIHRoYXQgc2FpZCBwcmVkaWNhdGUKYmVjb21lcyB0cnVlLgoKU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgv
dm14LmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMKQEAgLTEyODMsNyArMTI4Myw3
IEBAIHN0YXRpYyB2b2lkIHZteF9oYW5kbGVfY2Qoc3RydWN0IHZjcHUgKnYKIAogc3RhdGljIHZv
aWQgdm14X3NldHVwX3RzY19zY2FsaW5nKHN0cnVjdCB2Y3B1ICp2KQogewotICAgIGlmICggIWh2
bV90c2Nfc2NhbGluZ19zdXBwb3J0ZWQgfHwgdi0+ZG9tYWluLT5hcmNoLnZ0c2MgKQorICAgIGlm
ICggdi0+ZG9tYWluLT5hcmNoLnZ0c2MgKQogICAgICAgICByZXR1cm47CiAKICAgICB2bXhfdm1j
c19lbnRlcih2KTsKQEAgLTIzNDYsNyArMjM0Niw2IEBAIHN0YXRpYyBzdHJ1Y3QgaHZtX2Z1bmN0
aW9uX3RhYmxlIF9faW5pdGQKICAgICAuYWx0cDJtX3ZjcHVfZW11bGF0ZV92bWZ1bmMgPSB2bXhf
dmNwdV9lbXVsYXRlX3ZtZnVuYywKICAgICAudHNjX3NjYWxpbmcgPSB7CiAgICAgICAgIC5tYXhf
cmF0aW8gPSBWTVhfVFNDX01VTFRJUExJRVJfTUFYLAotICAgICAgICAuc2V0dXAgICAgID0gdm14
X3NldHVwX3RzY19zY2FsaW5nLAogICAgIH0sCiB9OwogCkBAIC0yNDg2LDcgKzI0ODUsMTAgQEAg
Y29uc3Qgc3RydWN0IGh2bV9mdW5jdGlvbl90YWJsZSAqIF9faW5pdAogICAgIH0KIAogICAgIGlm
ICggY3B1X2hhc192bXhfdHNjX3NjYWxpbmcgKQorICAgIHsKICAgICAgICAgdm14X2Z1bmN0aW9u
X3RhYmxlLnRzY19zY2FsaW5nLnJhdGlvX2ZyYWNfYml0cyA9IDQ4OworICAgICAgICB2bXhfZnVu
Y3Rpb25fdGFibGUudHNjX3NjYWxpbmcuc2V0dXAgPSB2bXhfc2V0dXBfdHNjX3NjYWxpbmc7Cisg
ICAgfQogCiAgICAgaWYgKCBjcHVfaGFzX21weCAmJiBjcHVfaGFzX3ZteF9tcHggKQogICAgIHsK
CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
