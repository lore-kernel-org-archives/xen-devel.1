From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 2/2] libxl: fix build (missing
 CLONE_NEWIPC) on astonishingly old systems
Date: Mon, 14 Jan 2019 11:37:39 +0000
Message-ID: <20190114113739.wv5an34y3jdtmb35@zion.uk.xensource.com>
References: <20190111182706.GA2199@perard.uk.xensource.com>
 <20190111192328.25242-1-ian.jackson@eu.citrix.com>
 <4C7EABEB02000006B8D7C7D4@prv1-mh.provo.novell.com>
 <9E406FBD020000569DFFD529@prv1-mh.provo.novell.com>
 <9E4077BD020000969DFFD529@prv1-mh.provo.novell.com>
 <81E41643020000ABCFD95477@prv1-mh.provo.novell.com>
 <CE47AFED020000429DFFD529@prv1-mh.provo.novell.com>
 <5C3C5ACE020000780020D1C3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Zeoe=PW=citrix.com=prvs=910b68455=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gj0Zn-0004uT-0e
 for xen-devel@lists.xenproject.org; Mon, 14 Jan 2019 11:38:43 +0000
Content-Disposition: inline
In-Reply-To: <5C3C5ACE020000780020D1C3@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMTQsIDIwMTkgYXQgMDI6NDc6NThBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDExLjAxLjE5IGF0IDIwOjIzLCA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNv
bT4gd3JvdGU6Cj4gPiBDTE9ORV9ORVdJUEMgd2FzIGludHJvZHVjZWQgaW4gTGludXggMi42LjE5
LCBvbiB0aGUgMjl0aCBvZiBOb3ZlbWJlcgo+ID4gMjAwNiwgd2hpY2ggd2FzIDEyIHllYXJzLCAx
IG1vbnRoLCBhbmQgMTQgZGF5cyBhZ28uCj4gCj4gVGhhbmtzIGZvciB0aGUgdmVyeSBwcmVjaXNl
IGNvdW50aW5nLCB0aGUgbGF0dGVyIHBhcnQgd2hpY2ggd2lsbCBiZQo+IHdyb25nIC0gZXZlbiBp
ZiBqdXN0IHNsaWdodGx5IC0gYnkgdGhlIHRpbWUgeW91IGNvbW1pdCBpdCA7LSkKPiAKPiA+IE5l
dmVydGhlbGVzcyBhcHBhcmVudGx5IHNvbWUgcGVvcGxlIGFyZSB0cnlpbmcgdG8gYnVpbGQgWGVu
IG9uIHN5c3RlbXMKPiA+IHdob3NlIGtlcm5lbCBoZWFkZXJzIGFyZSB0aGF0IG9sZC4gIFBsYWNh
dGUgdGhlc2UgcGVvcGxlIGJ5IHByb3ZpZGluZwo+ID4gYSBmYWxsYmFjayAjZGVmaW5lIGZvciBD
TE9ORV9ORVdJUEMuCj4gPiAKPiA+IFRoZSBhY3R1YWwgYmluYXJ5IHZhbHVlIHdpbGwgb2YgY291
cnNlIHJlbWFpbiBjb25zdGFudCwgYmVjYXVzZSBvZiB0aGUKPiA+IGtlcm5lbCBBUEkgcHJvbWlz
ZSwgc28gdGhpcyBpcyBhbmQgd2lsbCBiZSBjb3JyZWN0IG9uIGFsbCBwbGF0Zm9ybXMKPiA+IHdo
ZXJlIHRoZSBDTE9ORV9ORVdJUEMgaXMgc3VwcG9ydGVkLiAgKEV2ZW4gaWYgZm9yIHNvbWUgcmVh
c29uIHdlIG1pc3MKPiA+IHRoZSByaWdodCAjaW5jbHVkZXMuKQo+ID4gCj4gPiBPZiBjb3Vyc2Ug
YXQgcnVudGltZSB0aGlzIHZhbHVlIHdpbGwgbm90IHdvcmsgb24gb2xkZXIga2VybmVscy4gIEl0
Cj4gPiB3aWxsIGJlIHJlamVjdGVkIGFzIHVua25vd24uCj4gCj4gU2FkbHkgdGhlIHNpdHVhdGlv
biBpcyBtb3JlIGNvbXBsaWNhdGVkOiBUaGUgY2hlY2sgdG8gZGlzYWxsb3cKPiB1bmtub3duIGZs
YWdzIHdhcyBpbnRyb2R1Y2VkIG9ubHkgaW4gMi42LjE3IFsxXSwgYW5kIGFwcGFyZW50bHkKPiBu
ZXZlciBiYWNrcG9ydGVkIHRvIDIuNi4xNiBvciBvbGRlciBzdGFibGUgdHJlZXMgZGVzcGl0ZSB0
aGUKPiBkZXNjcmlwdGlvbiB0YWxraW5nIGFib3V0IGl0IGdvaW5nIGludG8gMi42LjE2LiBTaW5j
ZSBpdCBkaWRuJ3QKPiBtYXR0ZXIgaW4gbXkgdmFyaWFudCBvZiB0aGUgd29ya2Fyb3VuZCwgSSBk
aWRuJ3QgbWVudGlvbiB0aGlzLgo+IAo+IE9mIGNvdXJzZSBhIHByZXR0eSByZWFzb25hYmxlIHBv
c2l0aW9uIHRvIHRha2Ugd291bGQgYmUgdG8KPiBjb25zaWRlciB0aGUgMi42LjE4LWJhc2VkIFhl
bm9MaW51eCB0cmVlIGEgImJhc2VsaW5lIiwgYmV5b25kCj4gd2hpY2ggd2UgZG9uJ3QgY2FyZSBh
Ym91dCB1bmRlc2lyYWJsZSBiZWhhdmlvciBoZXJlLgoKSSB0aGluayB1c2luZyAyLjYuMTggYXMg
YmFzZWxpbmUgaXMgdmVyeSByZWFzb25hYmxlLiAKCldlaS4KCj4gCj4gSmFuCj4gCj4gWzFdIDA2
ZjlkNGY5NGEgdW5zaGFyZTogRXJyb3IgaWYgcGFzc2VkIHVuc3VwcG9ydGVkIGZsYWdzCj4gCj4g
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
