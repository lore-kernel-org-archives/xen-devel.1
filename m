From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] libxc/x86: don't hand through CPUID leaf
 0x80000008 as is
Date: Thu, 17 May 2018 07:38:18 -0600
Message-ID: <5AFD85CA02000078001C3A3B@prv1-mh.provo.novell.com>
References: <5AFD818C02000078001C39E7@prv1-mh.provo.novell.com>
 <0b9549fd-d943-d98f-0c08-e07ad8167e6d@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=rtgu=ie=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fJJ6t-0006aM-3U
 for xen-devel@lists.xenproject.org; Thu, 17 May 2018 13:38:23 +0000
In-Reply-To: <0b9549fd-d943-d98f-0c08-e07ad8167e6d@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA1LjE4IGF0IDE1OjI2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTcvMDUvMTggMTQ6MjAsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBKdXN0IGxpa2Ug
Zm9yIEhWTSB0aGUgZmVhdHVyZSBzZXQgc2hvdWxkIGJlIHVzZWQgZm9yIEVCWCBvdXRwdXQsIHdo
aWxlCj4+IEVBWCBzaG91bGQgYmUgcmVzdHJpY3RlZCB0byB0aGUgbG93IDE2IGJpdHMgYW5kIEVD
WC9FRFggc2hvdWxkIGJlIHplcm8uCj4+Cj4+IFNob3J0IG9mIHRoZXJlIGJlaW5nIHdoaXRlIGxp
c3RpbmcgaW4gcGxhY2UganVzdCBsaWtlIG9uIHRoZSBIVk0gc2lkZSwKPj4gYWxzbyB6YXAgbGVh
dmVzIDYsIDksIGFuZCAweDgwMDAwMDA3IGFzIHdlbGwgYXMgdW5rbm93biAvIHJlc2VydmVkIG9u
ZXMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
PiAKPiBEbyB5b3Ugd2FudCB0aGlzIGZvciBiYWNrcG9ydGluZz8KCk5vdCByZWFsbHksIGF0IGxl
YXN0IHRoYXQgd2Fzbid0IGEgcHJpbWFyeSBnb2FsLgoKPiBUaGUgY2hhbmdlcyBiZWxvdyBhcmUg
ZW5mb3JjZWQgYnkgcmVjYWxjdWxhdGVfY3B1aWRfcG9saWN5KCkgKGFuZCBpbgo+IHBhcnRpY3Vs
YXIsIHJlY2FsdWNsYXRlX21pc2MoKSkgaW4gdGhlIGh5cGVydmlzb3IgZm9yIHRoZSBwYXN0IGZl
dwo+IHJlbGVhc2VzLCBhbmQgU2VyZ2V5IGlzIGN1cnJlbnRseSBpbiB0aGUgcHJvY2VzcyBvZiBt
YWtpbmcgYWxsIG9mIHRoaXMKPiBsaWJ4YyBsb2dpYyBkaXNhcHBlYXIuCgpXZWxsLCBtYXliZSBJ
J20gc2ltcGx5IGNvbmZ1c2VkOiBDb21taXQgZDI5N2I1NjY4MiAoIng4Ni9jcHVpZDogSGFuZGxp
bmcKb2YgSUJSUy9JQlBCLCBTVElCUCBhbmQgSUJSUyBmb3IgZ3Vlc3RzIikgaW50cm9kdWNlZCBz
aW1pbGFyIGNvZGUgaW50bwp4Y19jcHVpZF9odm1fcG9saWN5KCkgd2l0aG91dCBkb2luZyB0aGUg
c2FtZSBmb3IgeGNfY3B1aWRfcHZfcG9saWN5KCkuClRoYXQncyBwcmV0dHkgcmVjZW50IGEgY29t
bWl0LCBhbmQgb25lIHRoYXQgaGFzIGJlZW4gYmFja3BvcnRlZCBhbGwgdGhlCndheSB0aHJvdWdo
IHRvIDQuNi4gQXJlIHlvdSBzYXlpbmcgdGhhdCB3YXMgYSBwb2ludGxlc3MgY2hhbmdlIHRoZW4/
CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
