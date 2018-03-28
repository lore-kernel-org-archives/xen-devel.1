From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 4/7] xen/x86: use invpcid for flushing
 the TLB
Date: Wed, 28 Mar 2018 07:56:58 -0600
Message-ID: <5ABBBB4A02000078001B6D42@prv1-mh.provo.novell.com>
References: <20180327090704.28646-1-jgross@suse.com>
 <20180327090704.28646-5-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=nfe5=gs=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f1BZW-0008Ac-CN
 for xen-devel@lists.xenproject.org; Wed, 28 Mar 2018 13:57:02 +0000
In-Reply-To: <20180327090704.28646-5-jgross@suse.com>
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
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjAzLjE4IGF0IDExOjA3LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBJZiBw
b3NzaWJsZSB1c2UgdGhlIElOVlBDSUQgaW5zdHJ1Y3Rpb24gZm9yIGZsdXNoaW5nIHRoZSBUTEIg
aW5zdGVhZCBvZgo+IHRvZ2dsaW5nIGNyNC5wZ2UgZm9yIHRoYXQgcHVycG9zZS4KPiAKPiBXaGls
ZSBhdCBpdCByZW1vdmUgdGhlIGRlcGVuZGVuY3kgb24gY3I0LnBnZSBiZWluZyByZXF1aXJlZCBm
b3IgbXRycgo+IGxvYWRpbmcsIGFzIHRoaXMgd2lsbCBiZSByZXF1aXJlZCBsYXRlciBhbnl3YXku
Cj4gCj4gQWRkIGEgY29tbWFuZCBsaW5lIG9wdGlvbiAiaW52cGNpZCIgZm9yIGNvbnRyb2xsaW5n
IHRoZSB1c2Ugb2YKPiBJTlZQQ0lEIChkZWZhdWx0IHRvIHRydWUpLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CndpdGggb25lIHJlbWFya3MgKHdoaWNoIGNvdWxkIGJl
IGFkZHJlc3NlZCB3aGlsZSBjb21taXR0aW5nKToKCj4gQEAgLTcxLDYgKzcyLDI1IEBAIHN0YXRp
YyB2b2lkIHBvc3RfZmx1c2godTMyIHQpCj4gICAgICB0aGlzX2NwdSh0bGJmbHVzaF90aW1lKSA9
IHQ7Cj4gIH0KPiAgCj4gK3N0YXRpYyB2b2lkIGRvX3RsYl9mbHVzaCh2b2lkKQo+ICt7Cj4gKyAg
ICB1MzIgdDsKPiArCj4gKyAgICB0ID0gcHJlX2ZsdXNoKCk7CgpJbiB0aGUgb3JpZ2luYWwgY29k
ZSB0aGlzIHdhcyB0aGUgaW5pdGlhbGl6ZXIgb2YgdGhlIHZhcmlhYmxlLCBhbmQgSSdkCnByZWZl
ciBpZiB0aGF0IHN0YXllZCB0aGF0IHdheSAodW5sZXNzIGxhdGVyIGNoYW5nZXMgcmVxdWlyZSB0
aGUKc3BsaXQpLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
