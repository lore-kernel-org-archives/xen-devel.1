From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [Makefile] asm: handle comments when creating
 header file
Date: Wed, 10 Jan 2018 09:02:17 -0700
Message-ID: <5A564719020000780019D4B8@prv-mh.provo.novell.com>
References: <1515597276-8279-1-git-send-email-nmanthey@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=2bb6=ef=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eZIpZ-0004f1-Vr
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2018 16:02:22 +0000
In-Reply-To: <1515597276-8279-1-git-send-email-nmanthey@amazon.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Norbert Manthey <nmanthey@amazon.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Michael Tautschnig <tautschn@amazon.co.uk>, Wei Liu <wei.liu2@citrix.com>, Norbert Manthey <nmanthey@amazon.de>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjAxLjE4IGF0IDE2OjE0LCA8bm1hbnRoZXlAYW1hem9uLmNvbT4gd3JvdGU6Cj4g
SW4gdGhlIGVhcmx5IHN0ZXBzIG9mIGNvbXBpbGF0aW9uLCB0aGUgYXNtIGhlYWRlciBmaWxlcyBh
cmUgY3JlYXRlZCwgc3VjaAo+IGFzIGluY2x1ZGUvYXNtLSQoVEFSR0VUX0FSQ0gpL2FzbS1vZmZz
ZXRzLmguIFRoZXNlIGZpbGVzIGRlcGVuZCBvbiB0aGUKPiBhc3NlbWJseSBmaWxlIGFyY2gvJChU
QVJHRVRfQVJDSCkvYXNtLW9mZnNldHMucywgd2hpY2ggaXMgZ2VuZXJhdGVkCj4gYmVmb3JlLiBE
ZXBlbmRpbmcgb24gdGhlIHVzZWQgYXNzZW1ibGVyLCB0aGVyZSBtaWdodCBiZSBjb21tZW50cyBp
biB0aGUKPiBhc3NlbWJseSBmaWxlcy4KPiAKPiBUaGlzIGNvbW1pdCBhZGRzIGhhbmRsaW5nIGNv
bW1lbnRzIGluIHRoZSBhc3NlbWJsZXIgZHVyaW5nIHRoZSBjcmVhdGlvbiBvZgo+IHRoZSBhc20g
aGVhZGVyIGZpbGVzLgoKSSBoYXZlIGEgaGFyZCB0aW1lIHNlZWluZyBob3cgLi4uCgo+IC0tLSBh
L3hlbi9NYWtlZmlsZQo+ICsrKyBiL3hlbi9NYWtlZmlsZQo+IEBAIC0xODksNyArMTg5LDcgQEAg
aW5jbHVkZS9hc20tJChUQVJHRVRfQVJDSCkvYXNtLW9mZnNldHMuaDogYXJjaC8kKFRBUkdFVF9B
UkNIKS9hc20tb2Zmc2V0cy5zCj4gIAkgIGVjaG8gIiNpZm5kZWYgX19BU01fT0ZGU0VUU19IX18i
OyBcCj4gIAkgIGVjaG8gIiNkZWZpbmUgX19BU01fT0ZGU0VUU19IX18iOyBcCj4gIAkgIGVjaG8g
IiI7IFwKPiAtCSAgc2VkIC1ybmUgIi89PT4ve3M6Lio9PT4oLiopPD09Lio6XDE6OyBzOiBbXCQk
I106IDo7IHA7fSI7IFwKCi4uLiB0aGlzIHBhdHRlcm4gY291bGQgbWF0Y2ggYW55IGNvbW1lbnQg
dGhhdCB3ZSBjdXJyZW50bHkgaGF2ZS4KV291bGQgeW91IG1pbmQgY2xhcmlmeWluZyB3aGF0IGl0
IGlzIHRoYXQgaXMgYWN0dWFsbHkgYnJva2VuIChhbmQKaGVuY2Ugd2FudHMvbmVlZHMgZml4aW5n
KT8KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
