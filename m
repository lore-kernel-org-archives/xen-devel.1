From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] xen: don't use privcmd_call() from
 xen_mc_flush()
Date: Tue, 7 Aug 2018 12:42:48 -0400
Message-ID: <5914dd79-bbeb-34f3-f4c5-d9434e96fb2c__14954.2550709613$1533660041$gmane$org@oracle.com>
References: <20180613095806.2978-1-jgross@suse.com>
 <2a9600b0-3b49-7835-a664-9deb30b100a4@suse.com>
 <a4f76a2a-128f-3e2a-44ee-04d57ab5be12@oracle.com>
 <ff2b390c-3b4f-67c4-5a1c-35be121fe281@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=x4l2=kw=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fn53O-0003lY-Gt
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 16:41:50 +0000
In-Reply-To: <ff2b390c-3b4f-67c4-5a1c-35be121fe281@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDcvMjAxOCAxMToxNyBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwNy8wOC8x
OCAxNjowMiwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+PiBPbiAwOC8wNy8yMDE4IDA5OjExIEFN
LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4gT24gMTMvMDYvMTggMTE6NTgsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6Cj4+Pj4gVXNpbmcgcHJpdmNtZF9jYWxsKCkgZm9yIGEgc2luZ2xldG9uIG11bHRp
Y2FsbCBzZWVtcyB0byBiZSB3cm9uZywgYXMKPj4+PiBwcml2Y21kX2NhbGwoKSBpcyB1c2luZyBz
dGFjKCkvY2xhYygpIHRvIGVuYWJsZSBoeXBlcnZpc29yIGFjY2VzcyB0bwo+Pj4+IExpbnV4IHVz
ZXIgc3BhY2UuCj4+Pj4KPj4+PiBBZGQgYSBuZXcgeGVuX3NpbmdsZV9jYWxsKCkgZnVuY3Rpb24g
dG8gYmUgdXNlIGZvciB0aGF0IHB1cnBvc2UuCj4+Pj4KPj4+PiBSZXBvcnRlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KPj4+IEJvcmlzLCBhbnkgb2JqZWN0aW9ucz8KPj4KPj4gSSB0
aGluayBKYW4gd2FudGVkIGEgY2hhbmdlIGluIGNvbW1pdCBtZXNzYWdlLiBJIGNhbiBjb21taXQg
d2l0aCB0aGlzOgo+Pgo+PiAiVXNpbmcgcHJpdmNtZF9jYWxsKCkgZm9yIGEgc2luZ2xldG9uIG11
bHRpY2FsbCBzZWVtcyB0byBiZSB3cm9uZywgYXMKPj4gIHByaXZjbWRfY2FsbCgpIGlzIHVzaW5n
IHN0YWMoKS9jbGFjKCkgdG8gZW5hYmxlIGh5cGVydmlzb3IgYWNjZXNzIHRvCj4+ICBMaW51eCB1
c2VyIHNwYWNlLgo+Pgo+PiAgRXZlbiBpZiBjdXJyZW50bHkgbm90IGEgcHJvYmxlbSAocHYgZG9t
YWlucyBjYW4ndCB1c2UgU01BUCB3aGlsZSBIVk0KPj4gIGFuZCBQVkggZG9tYWlucyBjYW4ndCB1
c2UgbXVsdGljYWxscykgdGhpbmdzIG1pZ2h0IGNoYW5nZSB3aGVuCj4+ICBQVkggZG9tMCBzdXBw
b3J0IGlzIGFkZGVkIHRvIHRoZSBrZXJuZWwuIgo+IFRoaXMgd291bGQgYmUgZmluZSwgdGhhbmtz
LgoKQXBwbGllZCB0byBmb3ItbGludXMtNC4xOQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
