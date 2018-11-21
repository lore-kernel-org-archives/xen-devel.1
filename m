From: Pankaj Gupta <pagupta@redhat.com>
Subject: Re: [PATCH v1 5/8] hv_balloon: mark inflated pages
 PG_offline
Date: Tue, 20 Nov 2018 20:04:51 -0500 (EST)
Message-ID: <1155749039.35435813.1542762291980.JavaMail.zimbra__14413.6096038439$1542762222$gmane$org@redhat.com>
References: <20181119101616.8901-1-david@redhat.com>
 <20181119101616.8901-6-david@redhat.com>
 <1747228.35250472.1542703532881.JavaMail.zimbra@redhat.com>
 <6258a58b-28c7-c055-0752-e8bd085b835f@redhat.com>
 <1380154502.35259416.1542706636322.JavaMail.zimbra@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DxZ4=OA=redhat.com=pagupta@srs-us1.protection.inumbo.net>)
 id 1gPGwo-0007nR-JM
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 01:04:54 +0000
In-Reply-To: <1380154502.35259416.1542706636322.JavaMail.zimbra@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Michal Hocko <mhocko@suse.com>, Stephen Hemminger <sthemmin@microsoft.com>, Kairui Song <kasong@redhat.com>, linux-pm@vger.kernel.org, pv-drivers@vmware.com, Haiyang Zhang <haiyangz@microsoft.com>, linux-doc@vger.kernel.org, kexec-ml <kexec@lists.infradead.org>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, devel@linuxdriverproject.org, Vitaly Kuznetsov <vkuznets@redhat.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: xen-devel@lists.xenproject.org

Cj4gPiA+PiAtLS0KPiA+ID4+ICBkcml2ZXJzL2h2L2h2X2JhbGxvb24uYyB8IDE0ICsrKysrKysr
KysrKy0tCj4gPiA+PiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4gPiA+Pgo+ID4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHYvaHZfYmFsbG9vbi5j
IGIvZHJpdmVycy9odi9odl9iYWxsb29uLmMKPiA+ID4+IGluZGV4IDIxMWYzZmUzYTAzOC4uNDc3
MTk4NjJlNTdmIDEwMDY0NAo+ID4gPj4gLS0tIGEvZHJpdmVycy9odi9odl9iYWxsb29uLmMKPiA+
ID4+ICsrKyBiL2RyaXZlcnMvaHYvaHZfYmFsbG9vbi5jCj4gPiA+PiBAQCAtNjgxLDggKzY4MSwx
MyBAQCBzdGF0aWMgc3RydWN0IG5vdGlmaWVyX2Jsb2NrIGh2X21lbW9yeV9uYiA9IHsKPiA+ID4+
ICAvKiBDaGVjayBpZiB0aGUgcGFydGljdWxhciBwYWdlIGlzIGJhY2tlZCBhbmQgY2FuIGJlIG9u
bGluZWQgYW5kIG9ubGluZQo+ID4gPj4gIGl0Lgo+ID4gPj4gICovCj4gPiA+PiAgc3RhdGljIHZv
aWQgaHZfcGFnZV9vbmxpbmVfb25lKHN0cnVjdCBodl9ob3RhZGRfc3RhdGUgKmhhcywgc3RydWN0
IHBhZ2UKPiA+ID4+ICAqcGcpCj4gPiA+PiAgewo+ID4gPj4gLQlpZiAoIWhhc19wZm5faXNfYmFj
a2VkKGhhcywgcGFnZV90b19wZm4ocGcpKSkKPiA+ID4+ICsJaWYgKCFoYXNfcGZuX2lzX2JhY2tl
ZChoYXMsIHBhZ2VfdG9fcGZuKHBnKSkpIHsKPiA+ID4+ICsJCWlmICghUGFnZU9mZmxpbmUocGcp
KQo+ID4gPj4gKwkJCV9fU2V0UGFnZU9mZmxpbmUocGcpOwo+ID4gPj4gIAkJcmV0dXJuOwo+ID4g
Pj4gKwl9Cj4gPiA+PiArCWlmIChQYWdlT2ZmbGluZShwZykpCj4gPiA+PiArCQlfX0NsZWFyUGFn
ZU9mZmxpbmUocGcpOwo+ID4gPj4gIAo+ID4gPj4gIAkvKiBUaGlzIGZyYW1lIGlzIGN1cnJlbnRs
eSBiYWNrZWQ7IG9ubGluZSB0aGUgcGFnZS4gKi8KPiA+ID4+ICAJX19vbmxpbmVfcGFnZV9zZXRf
bGltaXRzKHBnKTsKPiA+ID4+IEBAIC0xMjAxLDYgKzEyMDYsNyBAQCBzdGF0aWMgdm9pZCBmcmVl
X2JhbGxvb25fcGFnZXMoc3RydWN0Cj4gPiA+PiBodl9keW5tZW1fZGV2aWNlCj4gPiA+PiAqZG0s
Cj4gPiA+PiAgCj4gPiA+PiAgCWZvciAoaSA9IDA7IGkgPCBudW1fcGFnZXM7IGkrKykgewo+ID4g
Pj4gIAkJcGcgPSBwZm5fdG9fcGFnZShpICsgc3RhcnRfZnJhbWUpOwo+ID4gPj4gKwkJX19DbGVh
clBhZ2VPZmZsaW5lKHBnKTsKPiA+ID4gCj4gPiA+IEp1c3QgdGhpbmtpbmcsIGRvIHdlIG5lZWQg
dG8gY2FyZSBmb3IgY2xlYXJpbmcgUGFnZU9mZmxpbmUgZmxhZyBiZWZvcmUKPiA+ID4gZnJlZWlu
Zwo+ID4gPiBhIGJhbGxvb24nZCBwYWdlPwo+ID4gCj4gPiBZZXMgd2UgaGF2ZSB0byBvdGhlcndp
c2UgdGhlIGNvZGUgd2lsbCBjcmFzaCB3aGVuIHRyeWluZyB0byBzZXQgUGFnZUJ1ZGR5Lgo+ID4g
Cj4gPiAob25seSBvbmUgcGFnZSB0eXBlIGF0IGEgdGltZSBtYXkgYmUgc2V0IHJpZ2h0IG5vdywg
YW5kIGl0IG1ha2VzIHNlbnNlLgo+ID4gQSBwYWdlIHRoYXQgaXMgb2ZmbGluZSBjYW5ub3QgZS5n
LiBiZSBhIGJ1ZGR5IHBhZ2UpCj4gCj4gby5rCj4gPiAKPiA+IFNvIFBhZ2VPZmZsaW5lIGlzIGNv
bXBsZXRlbHkgbWFuYWdlZCBieSB0aGUgcGFnZSBvd25lci4KPiAKPiBNYWtlcyBzZW5zZS4gVGhh
bmtzIGZvciBleHBsYWluaW5nLgoKTG9va3MgZ29vZCB0byBtZS4KCkFja2VkLWJ5OiBQYW5rYWog
Z3VwdGEgPHBhZ3VwdGFAcmVkaGF0LmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
