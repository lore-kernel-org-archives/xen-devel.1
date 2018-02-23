From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86/HVM: don't give the wrong impression
 of WRMSR succeeding
Date: Fri, 23 Feb 2018 03:12:27 -0700
Message-ID: <5A8FF71B02000078001AACBE@prv-mh.provo.novell.com>
References: <5A8ED75E02000078001AA6A4@prv-mh.provo.novell.com>
 <5A8FE09E02000078001AABC6@prv-mh.provo.novell.com>
 <6bbd6b49-6781-4fbb-3d5d-78ce183bda65@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=cwfe=fr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1epALD-00026R-HT
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 10:12:35 +0000
In-Reply-To: <6bbd6b49-6781-4fbb-3d5d-78ce183bda65@citrix.com>
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
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjAyLjE4IGF0IDExOjA3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjMvMDIvMjAxOCAwODozNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IC4uLiBmb3Ig
bm9uLWV4aXN0ZW50IE1TUnM6IHdybXNyX2h5cGVydmlzb3JfcmVncygpJ3MgY29tbWVudCBjbGVh
cmx5Cj4+IHNheXMgdGhhdCB0aGUgZnVuY3Rpb24gcmV0dXJucyAwIGZvciB1bnJlY29nbml6ZWQg
TVNScywgc28KPj4ge3N2bSx2bXh9X21zcl93cml0ZV9pbnRlcmNlcHQoKSBzaG91bGQgbm90IGNv
bnZlcnQgdGhpcyBpbnRvIHN1Y2Nlc3MuIFdlCj4+IGRvbid0IHdhbnQgdG8gdW5jb25kaXRpb25h
bGx5IGZhaWwgdGhlIGFjY2VzcyB0aG91Z2gsIGFzIHdlIGNhbid0IGJlCj4+IGNlcnRhaW4gdGhl
IGxpc3Qgb2YgaGFuZGxlZCBNU1JzIGlzIGNvbXBsZXRlIGVub3VnaCBmb3IgdGhlIGd1ZXN0IHR5
cGVzCj4+IHdlIGNhcmUgYWJvdXQsIHNvIGluc3RlYWQgbWlycm9yIHdoYXQgd2UgZG8gb24gdGhl
IHJlYWQgcGF0aHMgYW5kIHByb2JlCj4+IHRoZSBNU1IgdG8gZGVjaWRlIHdoZXRoZXIgdG8gcmFp
c2UgI0dQLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+Cj4gCj4gSSdtIG5vdCBhIGZhbiBvZiB0aGlzIGFwcHJvYWNoLCBidXQgSSBhY2NlcHQgdGhh
dCBpdCBtaWdodCBiZSB0aGUgbGVhc3QKPiBiYWQgb3B0aW9uIGdvaW5nLgo+IAo+IEhvd2V2ZXIs
IEknbSBzdHJ1Z2dsaW5nIHRvIHVuZGVyc3RhbmQgaG93IGl0IHJlc29sdmVzIHRoZSBpc3N1ZSB5
b3UKPiBwcmVzZW50ZWQ/ICBJbiB0aGUgZXhhbXBsZSwgTGludXggZGlkIGEgd3Jtc3Jfc2FmZSgp
IHRoZW4gYmxldyB1cCBvbiBhCj4gcmRtc3IoKS4gIFdhcyB0aGF0IGluIGZhY3QgcnVubmluZyBv
biBoYXJkd2FyZSBsYWNraW5nIFBTUi9Rb1Mgc3VwcG9ydD8KCk90aGVyd2lzZSB0aGUgUkRNU1Ig
d291bGRuJ3QgaGF2ZSBmYWlsZWQuCgo+IElycmVzcGVjdGl2ZSwgSSB0aGluayB0aGF0IGVudGly
ZSBibG9jayBvZiBNU1JzIHdhbnRzIGJsYWNrbGlzdGluZyBpbgo+IHRoZSBzaG9ydCB0ZXJtLCB0
byBtYWtlIHRoZW0gaW5hY2Nlc3NpYmxlLgoKVGhhdCB3b3VsZCBkZWFsIHdpdGggdGhpcyBwYXJ0
aWN1bGFyIGlzc3VlIGluIExpbnV4LCBidXQgbm9yIHRoZQpnZW5lcmFsIHBhdHRlcm4uCgpKYW4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
