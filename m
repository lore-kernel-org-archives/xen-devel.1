From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/3] xen/swiotlb: fix condition for
 calling xen_destroy_contiguous_region()
Date: Wed, 29 May 2019 03:52:17 -0600
Message-ID: <5CEE56510200007800233550__20751.8623372138$1559123607$gmane$org@prv1-mh.provo.novell.com>
References: <20190529090407.1225-1-jgross@suse.com>
 <20190529090407.1225-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9SAg=T5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hVvFy-0001F0-6u
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 09:52:26 +0000
In-Reply-To: <20190529090407.1225-2-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, iommu@lists.linux-foundation.org, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjA1LjE5IGF0IDExOjA0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBUaGUg
Y29uZGl0aW9uIGluIHhlbl9zd2lvdGxiX2ZyZWVfY29oZXJlbnQoKSBmb3IgZGVjaWRpbmcgd2hl
dGhlciB0bwo+IGNhbGwgeGVuX2Rlc3Ryb3lfY29udGlndW91c19yZWdpb24oKSBpcyB3cm9uZzog
aW4gY2FzZSB0aGUgcmVnaW9uIHRvCj4gYmUgZnJlZWQgaXMgbm90IGNvbnRpZ3VvdXMgY2FsbGlu
ZyB4ZW5fZGVzdHJveV9jb250aWd1b3VzX3JlZ2lvbigpIGlzCj4gdGhlIHdyb25nIHRoaW5nIHRv
IGRvOiBpdCB3b3VsZCByZXN1bHQgaW4gaW5jb25zaXN0ZW50IG1hcHBpbmdzIG9mCj4gbXVsdGlw
bGUgUEZOcyB0byB0aGUgc2FtZSBNRk4uIFRoaXMgd2lsbCBsZWFkIHRvIHZhcmlvdXMgc3RyYW5n
ZQo+IGNyYXNoZXMgb3IgZGF0YSBjb3JydXB0aW9uLgo+IAo+IEluc3RlYWQgb2YgY2FsbGluZyB4
ZW5fZGVzdHJveV9jb250aWd1b3VzX3JlZ2lvbigpIGluIHRoYXQgY2FzZSBhCj4gd2FybmluZyBz
aG91bGQgYmUgaXNzdWVkIGFzIHRoYXQgc2l0dWF0aW9uIHNob3VsZCBuZXZlciBvY2N1ci4KPiAK
PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZyAKPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9y
aXMub3N0cm92c2t5QG9yYWNsZS5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
