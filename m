From: "Jan Beulich" <JBeulich@suse.com>
Subject: Ping: [PATCH] x86: make arch_set_info_guest() match
 comments in load_segments()
Date: Thu, 16 Aug 2018 02:01:42 -0600
Message-ID: <5B752F6602000078001DEBBD@prv1-mh.provo.novell.com>
References: <5B4486CA02000078001D2907@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=x9l4=k7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fqDE0-0007ai-Ma
 for xen-devel@lists.xenproject.org; Thu, 16 Aug 2018 08:01:44 +0000
In-Reply-To: <5B4486CA02000078001D2907@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjA3LjE4IGF0IDEyOjEzLCAgd3JvdGU6Cj4gRm9yIGJvdGggZnNfYmFzZSBhbmQg
Z3NfYmFzZV91c2VyLCB0aGVyZSBhcmUgY29tbWVudHMgc2F5aW5nICJUaGlzIGNhbgo+IG9ubHkg
YmUgbm9uLXplcm8gaWYgc2VsZWN0b3IgaXMgTlVMTC4iIFdoaWxlIHNhdmVfc2VnbWVudHMoKSBl
bnN1cmVzCj4gdGhpcywgc28gZmFyIGFyY2hfc2V0X2luZm9fZ3Vlc3QoKSBkaWRuJ3QuIE1ha2Ug
YmVoYXZpb3IgY29uc2lzdGVudAo+IChhdHRhY2hpbmcgY29tbWVudHMgaWRlbnRpY2FsIHRvIHRo
b3NlIGluIHNhdmVfc2VnbWVudHMoKSkuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9kb21haW4uYwo+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYwo+IEBAIC05MzAsOSArOTMwLDEzIEBAIGludCBhcmNo
X3NldF9pbmZvX2d1ZXN0KAo+ICAgICAgaWYgKCAhY29tcGF0ICkKPiAgICAgIHsKPiAgICAgICAg
ICB2LT5hcmNoLnB2X3ZjcHUuc3lzY2FsbF9jYWxsYmFja19laXAgPSBjLm5hdC0+c3lzY2FsbF9j
YWxsYmFja19laXA7Cj4gLSAgICAgICAgdi0+YXJjaC5wdl92Y3B1LmZzX2Jhc2UgPSBjLm5hdC0+
ZnNfYmFzZTsKPiArICAgICAgICAvKiBub24tbnVsIHNlbGVjdG9yIGtpbGxzIGZzX2Jhc2UgKi8K
PiArICAgICAgICB2LT5hcmNoLnB2X3ZjcHUuZnNfYmFzZSA9Cj4gKyAgICAgICAgICAgICEodi0+
YXJjaC51c2VyX3JlZ3MuZnMgJiB+MykgPyBjLm5hdC0+ZnNfYmFzZSA6IDA7Cj4gICAgICAgICAg
di0+YXJjaC5wdl92Y3B1LmdzX2Jhc2Vfa2VybmVsID0gYy5uYXQtPmdzX2Jhc2Vfa2VybmVsOwo+
IC0gICAgICAgIHYtPmFyY2gucHZfdmNwdS5nc19iYXNlX3VzZXIgPSBjLm5hdC0+Z3NfYmFzZV91
c2VyOwo+ICsgICAgICAgIC8qIG5vbi1udWwgc2VsZWN0b3Iga2lsbHMgZ3NfYmFzZV91c2VyICov
Cj4gKyAgICAgICAgdi0+YXJjaC5wdl92Y3B1LmdzX2Jhc2VfdXNlciA9Cj4gKyAgICAgICAgICAg
ICEodi0+YXJjaC51c2VyX3JlZ3MuZ3MgJiB+MykgPyBjLm5hdC0+Z3NfYmFzZV91c2VyIDogMDsK
PiAgICAgIH0KPiAgICAgIGVsc2UKPiAgICAgIHsKPiAKPiAKCgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
