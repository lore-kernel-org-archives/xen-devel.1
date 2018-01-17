From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v8 11/17] x86: Protect unaware domains from
 meddling hyperthreads
Date: Wed, 17 Jan 2018 01:40:56 -0700
Message-ID: <5A5F1A28020000780019F593@prv-mh.provo.novell.com>
References: <1515780067-31735-1-git-send-email-andrew.cooper3@citrix.com>
 <1515780067-31735-12-git-send-email-andrew.cooper3@citrix.com>
 <5A5C9DF5020000780019EBCA@prv-mh.provo.novell.com>
 <fd4555a3-ec19-e282-7a3a-51e47b0f6479@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <fd4555a3-ec19-e282-7a3a-51e47b0f6479@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjAxLjE4IGF0IDIyOjExLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQW4gYWx0ZXJuYXRpdmUgdG8gdGhlIGN1cnJlbnQgbGV2ZWxsaW5nIGxvZ2ljIHdvdWxk
IGJlIHRvIHRyZWF0IFNUSUJQIGFzCj4gYSBTcGVjaWFsIEJpdCAoaW4gQ1BVSUQgdGVybXMsIGxp
a2UgT1NYU0FWRS9ldGMpIGFuZCB1bmNvbmRpdGlvbmFsbHkgc2V0Cj4gaXQgZXF1YWwgdG8gSUJS
UywgaXJyZXNwZWN0aXZlIG9mIHRoZSB0b29sc3RhY2sgc2V0dGluZy4gIFRoYXQgd2F5LAo+IG1p
Z3JhdGlvbiBiZXR3ZWVuIEhUIGFuZCBub24tSFQgaGFyZHdhcmUgaXMgc2FmZSBhbmQgYSBWTSB3
aGljaCBjaG9vc2VzCj4gdG8gdXNlIFNUSUJQIHdpbGwgd29yayBldmVuIG9uIG5vbi1IVCBoYXJk
d2FyZSB3aGljaCBzaW1wbHkgaWdub3JlcyB0aGUKPiByZXF1ZXN0LgoKV291bGRuJ3QgdGhhdCBv
dmVyYWxsIHJlc3VsdCBpbiBzaW1wbGVyIGNvZGUgYW55d2F5PwoKSmFuCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
