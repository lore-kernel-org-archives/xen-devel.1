From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH Makefile v2] asm: handle comments when
 creating header file
Date: Wed, 06 Feb 2019 08:10:09 -0700
Message-ID: <5C5AF8D10200007800214573@prv1-mh.provo.novell.com>
References: <5A66FF2002000078001A162C@prv-mh.provo.novell.com>
 <1549462173-9343-1-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F3w5=QN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1grOq8-0003Cd-OQ
 for xen-devel@lists.xenproject.org; Wed, 06 Feb 2019 15:10:16 +0000
In-Reply-To: <1549462173-9343-1-git-send-email-nmanthey@amazon.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: nmanthey@amazon.de
Cc: Michael Tautschnig <tautschn@amazon.co.uk>, Norbert Manthey <nmanthey@amazon.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjAyLjE5IGF0IDE1OjA5LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBG
cm9tOiBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5jb20+Cj4gCj4gSW4gdGhlIGVh
cmx5IHN0ZXBzIG9mIGNvbXBpbGF0aW9uLCB0aGUgYXNtIGhlYWRlciBmaWxlcyBhcmUgY3JlYXRl
ZCwgc3VjaAo+IGFzIGluY2x1ZGUvYXNtLSQoVEFSR0VUX0FSQ0gpL2FzbS1vZmZzZXRzLmguIFRo
ZXNlIGZpbGVzIGRlcGVuZCBvbiB0aGUKPiBhc3NlbWJseSBmaWxlIGFyY2gvJChUQVJHRVRfQVJD
SCkvYXNtLW9mZnNldHMucywgd2hpY2ggaXMgZ2VuZXJhdGVkCj4gYmVmb3JlLiBEZXBlbmRpbmcg
b24gdGhlIHVzZWQgdG9vbGNoYWluLCB0aGVyZSBtaWdodCBiZSBjb21tZW50cyBpbiB0aGUKPiBh
c3NlbWJseSBmaWxlcy4gRXNwZWNpYWxseSB0aGUgZ290by1nY2MgY29tcGlsZXIgb2YgdGhlIGJv
dW5kZWQgbW9kZWwKPiBjaGVja2VyIENCTUMgYWRkcyBjb21tZW50cyB0aGF0IHN0YXJ0IHdpdGgg
YSAnIycgc3ltYm9sIGF0IHRoZSBiZWdpbm5pbmcKPiBvZiB0aGUgbGluZS4KPiAKPiBUaGlzIGNv
bW1pdCBhZGRzIGhhbmRsaW5nIGNvbW1lbnRzIGluIGFzc2VtYmxlciBkdXJpbmcgdGhlIGNyZWF0
aW9uIG9mIHRoZQo+IGFzbSBoZWFkZXIgZmlsZXMsIGVzcGVjaWFsbHkgaWdub3JpbmcgbGluZXMg
dGhhdCBzdGFydCB3aXRoICcjJywgd2hpY2gKPiBpbmRpY2F0ZSBjb21tZW50cyBmb3IgYm90aCBB
Uk0gYW5kIHg4NiBhc3NlbWJsZXIuIFRoZSB1c2VkIHRvb2wgZ290by1hcwo+IHByb2R1Y2VzIGV4
YWN0bHkgY29tbWVudHMgb2YgdGhpcyBraW5kLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE5vcmJlcnQg
TWFudGhleSA8bm1hbnRoZXlAYW1hem9uLmRlPgo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgVGF1
dHNjaG5pZyA8dGF1dHNjaG5AYW1hem9uLmNvLnVrPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
