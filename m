From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 6/9] x86/genapic: patch indirect calls to
 direct ones
Date: Fri, 21 Sep 2018 05:53:37 -0600
Message-ID: <5BA4DBC102000078001EA8E1@prv1-mh.provo.novell.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
 <5B97C4A502000078001E748B@prv1-mh.provo.novell.com>
 <20180921110338.n3b46fympofoupfk@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=q3to=md=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g3K0C-0003E6-QC
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 11:53:41 +0000
In-Reply-To: <20180921110338.n3b46fympofoupfk@zion.uk.xensource.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjA5LjE4IGF0IDEzOjAzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVHVlLCBTZXAgMTEsIDIwMTggYXQgMDc6MzU6MzNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbWFjaC1nZW5lcmljL21hY2hfYXBpYy5o
Cj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbWFjaC1nZW5lcmljL21hY2hfYXBpYy5oCj4+
IEBAIC0xNSw4ICsxNSwxOCBAQAo+PiAgI2RlZmluZSBUQVJHRVRfQ1BVUyAoKGNvbnN0IHR5cGVv
ZihjcHVfb25saW5lX21hcCkgKikmY3B1X29ubGluZV9tYXApCj4+ICAjZGVmaW5lIGluaXRfYXBp
Y19sZHIgKGdlbmFwaWMuaW5pdF9hcGljX2xkcikKPj4gICNkZWZpbmUgY2x1c3RlcmVkX2FwaWNf
Y2hlY2sgKGdlbmFwaWMuY2x1c3RlcmVkX2FwaWNfY2hlY2spCj4+IC0jZGVmaW5lIGNwdV9tYXNr
X3RvX2FwaWNpZCAoZ2VuYXBpYy5jcHVfbWFza190b19hcGljaWQpCj4+IC0jZGVmaW5lIHZlY3Rv
cl9hbGxvY2F0aW9uX2NwdW1hc2soY3B1KSAoZ2VuYXBpYy52ZWN0b3JfYWxsb2NhdGlvbl9jcHVt
YXNrKGNwdSkpCj4+ICsjZGVmaW5lIGNwdV9tYXNrX3RvX2FwaWNpZChtYXNrKSAoeyBcCj4+ICsJ
LyogXAo+PiArCSAqIFRoZXJlIGFyZSBhIG51bWJlciBvZiBwbGFjZXMgd2hlcmUgdGhlIGFkZHJl
c3Mgb2YgYSBsb2NhbCB2YXJpYWJsZSBcCj4+ICsJICogZ2V0cyBwYXNzZWQgaGVyZS4gVGhlIHVz
ZSBvZiA/OiBpbiBhbHRlcm5hdGl2ZV9jYWxsPE4+KCkgdHJpZ2dlcnMgYW4gXAo+PiArCSAqICJh
ZGRyZXNzIG9mIC4uLiBpcyBhbHdheXMgdHJ1ZSIgd2FybmluZyBpbiBzdWNoIGEgY2FzZSB3aXRo
IGF0IGxlYXN0IFwKPj4gKwkgKiBnY2MgNyBhbmQgOC4gSGVuY2UgdGhlIHNlZW1pbmdseSBwb2lu
dGxlc3MgbG9jYWwgdmFyaWFibGUgaGVyZS4gXAo+PiArCSAqLyBcCj4gCj4gSXMgdGhpcyBzdGls
bCBuZWVkZWQgZ2l2ZW4geW91IGhhdmUgYnJvdWdodCBiYWNrIHRoZSBtaWRkbGUgb3BlcmFuZCBp
biA/OiBpbgo+IHBhdGNoIDE/CgpZZXMsIHVuZm9ydHVuYXRlbHkuIFRoZSBvbWl0dGVkIG1pZGRs
ZSBvcGVyYW5kIHNpbGVuY2VkIGEgd2FybmluZwp3aGVuIChhcmcpIHdhcyBvZiB0eXBlIGJvb2wu
IFRoaXMgaXMgdW5yZWxhdGVkIHRvIHRoZSBjb21waWxlciByZWNvZ25pemluZwp0aGF0IHRoZSBh
ZGRyZXNzIG9mIGEgbG9jYWwgdmFyaWFibGUgaXMgbmV2ZXIgZ29pbmcgdG8gYmUgTlVMTC4KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
