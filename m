From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/2] xen: introduce a cpumask with all bits
 set
Date: Thu, 14 Mar 2019 14:25:32 +0100
Message-ID: <36986c14-92fa-10e9-8ed7-7c290e360a6c@suse.com>
References: <20190314095953.11752-1-jgross@suse.com>
 <20190314095953.11752-2-jgross@suse.com> <5C8A534F020000780021E9C5@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=X/If=RR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h4QMd-0004i9-Sr
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 13:25:39 +0000
In-Reply-To: <5C8A534F020000780021E9C5@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDMvMjAxOSAxNDoxMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTQuMDMuMTkg
YXQgMTA6NTksIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBAQCAtMTg5Miw4ICsxODkxLDcg
QEAgc3RhdGljIHZvaWQgX19pbml0IGNoZWNrX3RpbWVyKHZvaWQpCj4+ICAgICAgdmVjdG9yID0g
SVJRMF9WRUNUT1I7Cj4+ICAgICAgY2xlYXJfaXJxX3ZlY3RvcigwKTsKPj4gIAo+PiAtICAgIGNw
dW1hc2tfc2V0YWxsKCZtYXNrX2FsbCk7Cj4+IC0gICAgaWYgKChyZXQgPSBiaW5kX2lycV92ZWN0
b3IoMCwgdmVjdG9yLCAmbWFza19hbGwpKSkKPj4gKyAgICBpZiAoKHJldCA9IGJpbmRfaXJxX3Zl
Y3RvcigwLCB2ZWN0b3IsICZjcHVtYXNrX2FsbCkpKQo+IAo+IFNpbmNlIHlvdSByZXBsYWNlIHRo
ZSB1c2VycyBvZiBjcHVtYXNrX3NldGFsbCgpLCB3b3VsZG4ndCBpdCBiZQo+IGJldHRlciB0byBh
bHNvIHJlbW92ZSB0aGF0IGZ1bmN0aW9uIGZyb20gdGhlIGhlYWRlcj8KCkkgZG9uJ3QgcmVwbGFj
ZSBhbGwgb2YgdGhlbS4gVGhlcmUgYXJlIHN0aWxsIHNvbWUgdXNlcnMgbGVmdCB3aGVyZQpyZXBs
YWNpbmcgd2l0aCBjcHVtYXNrX2FsbCB3b3VsZCBiZSBsZXNzIG9wdGltYWwuCgoKSnVlcmdlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
