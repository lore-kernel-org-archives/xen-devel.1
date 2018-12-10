From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/vm_event: block interrupt injection for
 sync vm_events
Date: Mon, 10 Dec 2018 07:32:51 -0700
Message-ID: <5C0E79130200007800204B67@prv1-mh.provo.novell.com>
References: <1544302120-13737-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gWMcC-0000zR-JO
 for xen-devel@lists.xenproject.org; Mon, 10 Dec 2018 14:32:56 +0000
In-Reply-To: <1544302120-13737-1-git-send-email-rcojocaru@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jun Nakajima <jun.nakajima@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjEyLjE4IGF0IDIxOjQ4LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gQmxvY2sgaW50ZXJydXB0cyAoaW4gdm14X2ludHJfYXNzaXN0KCkpIGZvciB0aGUgZHVy
YXRpb24gb2YKPiBwcm9jZXNzaW5nIGEgc3luYyB2bV9ldmVudCAoc2ltaWxhcmx5IHRvIHRoZSBz
dHJhdGVneQo+IGN1cnJlbnRseSB1c2VkIGZvciBzaW5nbGUtc3RlcHBpbmcpLiBPdGhlcndpc2Us
IGF0dGVtcHRpbmcKPiB0byBlbXVsYXRlIGFuIGluc3RydWN0aW9uIHdoZW4gcmVxdWVzdGVkIGJ5
IGEgdm1fZXZlbnQKPiByZXBseSBtYXkgbGVnaXRpbWF0ZWx5IG5lZWQgdG8gY2FsbCBodm1faW5q
ZWN0X3BhZ2VfZmF1bHQoKSwKPiB3aGljaCB0aGVuIG92ZXJ3cml0ZXMgdGhlIGFjdGl2ZSBpbnRl
cnJ1cHQgaW4gdGhlIFZNQ1MuCgpJIHRha2UgaXQgdGhhdCBodm1faW5qZWN0X3BhZ2VfZmF1bHQo
KSBpcyBqdXN0IHRoZSBtb3N0IHByb21pbmVudApleGFtcGxlLiBJZiBzbywgd29sZCB5b3UgbWlu
ZCBhZGRpbmcgImUuZy4iPwoKPiBAQCAtMjM5LDYgKzI0MSwxMiBAQCB2b2lkIHZteF9pbnRyX2Fz
c2lzdCh2b2lkKQo+ICAgICAgICAgIHJldHVybjsKPiAgICAgIH0KPiAgCj4gKyAgICAvKiBCbG9j
ayBldmVudCBpbmplY3Rpb24gd2hpbGUgaGFuZGxpbmcgYSBzeW5jIHZtX2V2ZW50LiAqLwo+ICsg
ICAgaWYgKCB1bmxpa2VseSh2LT5hcmNoLnZtX2V2ZW50KSAmJgo+ICsgICAgICAgICB2bV9ldmVu
dF9jaGVja19yaW5nKHYtPmRvbWFpbi0+dm1fZXZlbnRfbW9uaXRvcikgJiYKCklzIHRoaXMgY2hl
Y2sgcmVhbGx5IG5lZWRlZD8KCj4gKyAgICAgICAgIHYtPmFyY2gudm1fZXZlbnQtPmludHJfYmxv
Y2sgKQoKVGhpcyBwYXJ0IGNlcnRhaW5seSBkb2Vzbid0IGxvb2sgdG8gZGVwZW5kIG9uIGl0LiBQ
ZXJoYXBzCi0+aW50cl9ibG9jayB3b3VsZCBiZXR0ZXIgYmUgY2xlYXJlZCB3aGVuIHRlYXJpbmcg
ZG93biBhIHJpbmc/CgpBbHNvIGlzIHRoZXJlIHJlYWxseSBubyBzaW1pbGFyIGNoYW5nZSBuZWVk
ZWQgb24gdGhlIEFNRCAoU1ZNKQpzaWRlPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
