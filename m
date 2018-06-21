From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v7 08/15] x86/cpu: Remove loop form
 vmce_save_vcpu_ctxt() func
Date: Thu, 21 Jun 2018 01:39:05 -0600
Message-ID: <5B2B561902000078001CC95C@prv1-mh.provo.novell.com>
References: <1528383573-21522-1-git-send-email-aisaila@bitdefender.com>
 <1528383573-21522-9-git-send-email-aisaila@bitdefender.com>
 <d459cb16ab834f15907b75b4266a22b8@AMSPEX02CL03.citrite.net>
 <1528447880.25123.36.camel@bitdefender.com>
 <d273805464a3476d9bebbf254cbc4124@AMSPEX02CL03.citrite.net>
 <5B1A95D702000078001C9878@prv1-mh.provo.novell.com>
 <1529484960.4608.16.camel@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1529484960.4608.16.camel@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian.Jackson@citrix.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjA2LjE4IGF0IDEwOjU2LCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IFNvIHRoZSBmaW5hbCBwbGFuIGZvciB0aGUgc2VyaWVzIGlzIGxpa2UgdGhpczoKPiAtIEJh
c2UgZXZlcnl0aGluZyBvbiBSb2dlcidzIHNlcmllcwo+IC0gS2VlcCBwYXRjaGVzIDEtNwo+IC0g
SGF2ZSBwYXRjaCA4IGFkZCBhbiBleHRyYSBhcmcgdG8gSFZNX1JFR0lTVEVSX1NBVkVfUkVTVE9S
RQo+IGFuZCBodm1fc3JfaGFuZGxlcnMKPiAtIEhhdmUgcGF0Y2ggOSBsaWtlIHRoZSBwYXRjaCAx
NSBmb3JtIG5vdyBhbmQgaGF2ZSBpdCBjYWxsIHRoZQo+IHNhdmVfb25lIGhhbmRsZXJzCj4gLSBI
YXZlIHRoZSBuZXh0IHBhdGNoZXMgcmVtb3ZlIHRoZSByZWR1bmRhbnQgc2F2ZSBoYW5kbGVycyBh
bmQKPiByZW5hbWUgdGhlIHNhdmUgb25lCj4gLSBUaGUgZmluYWwgcGF0Y2ggc2hvdWxkIHJlbW92
ZSB0aGUgZXh0cmEgYXJnLiBUaGlzIG9uZSBjYW4gYmUKPiBrZXB0IG9yIG5vdC4KClNvdW5kcyBy
ZWFzb25hYmxlLCBhbGJlaXQgSSBoYXZlIHRvIGFkbWl0IEknbSBub3Qgc3VyZSB3aGF0IHRoZSBs
YXN0CnNlbnRlbmNlIGlzIHN1cHBvc2VkIHRvIG1lYW4uIEVpdGhlciBpdCBpcyBwb3NzaWJsZSB0
byBlbGltaW5hdGUgdGhlCmV4dHJhIGFyZywgdGhlbiB5b3Ugc2hvdWxkIGRvIHNvLCBvciBpdCBp
cyBub3QgcG9zc2libGUgKGluIHdoaWNoIGNhc2UKeW91IGNhbid0IHBvc3NpYmx5IGFkZCBhIHJl
c3BlY3RpdmUgcGF0Y2ggdG8gdGhlIHNlcmllcykuIAoKSmFuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
