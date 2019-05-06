From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC V2 30/45] xen/sched: rework and rename
 vcpu_force_reschedule()
Date: Mon, 06 May 2019 02:37:12 -0600
Message-ID: <5CCFF238020000780022C0F9@prv1-mh.provo.novell.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-31-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hNZ7m-0000rb-WC
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 08:37:27 +0000
In-Reply-To: <20190506065644.7415-31-jgross@suse.com>
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjA1LjE5IGF0IDA4OjU2LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiAtLS0g
YS94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPiArKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPiBA
QCAtODA4LDIxICs4MDgsMjQgQEAgc3RhdGljIHZvaWQgdmNwdV9taWdyYXRlX2ZpbmlzaChzdHJ1
Y3QgdmNwdSAqdikKPiAgfQo+ICAKPiAgLyoKPiAtICogRm9yY2UgYSBWQ1BVIHRocm91Z2ggYSBk
ZXNjaGVkdWxlL3Jlc2NoZWR1bGUgcGF0aC4KPiAtICogRm9yIGV4YW1wbGUsIHVzaW5nIHRoaXMg
d2hlbiBzZXR0aW5nIHRoZSBwZXJpb2RpYyB0aW1lciBwZXJpb2QgbWVhbnMgdGhhdAo+IC0gKiBt
b3N0IHBlcmlvZGljLXRpbWVyIHN0YXRlIG5lZWQgb25seSBiZSB0b3VjaGVkIGZyb20gd2l0aGlu
IHRoZSBzY2hlZHVsZXIKPiAtICogd2hpY2ggY2FuIHRodXMgYmUgZG9uZSB3aXRob3V0IG5lZWQg
Zm9yIHN5bmNocm9uaXNhdGlvbi4KPiArICogU2V0IHRoZSBwZXJpb2RpYyB0aW1lciBvZiBhIHZj
cHUuCj4gICAqLwo+IC12b2lkIHZjcHVfZm9yY2VfcmVzY2hlZHVsZShzdHJ1Y3QgdmNwdSAqdikK
PiArdm9pZCB2Y3B1X3NldF9wZXJpb2RpY190aW1lcihzdHJ1Y3QgdmNwdSAqdiwgc190aW1lX3Qg
dmFsdWUpCj4gIHsKPiAtICAgIHNwaW5sb2NrX3QgKmxvY2sgPSBpdGVtX3NjaGVkdWxlX2xvY2tf
aXJxKHYtPnNjaGVkX2l0ZW0pOwo+ICsgICAgc190aW1lX3Qgbm93ID0gTk9XKCk7Cj4gIAo+IC0g
ICAgaWYgKCB2LT5zY2hlZF9pdGVtLT5pc19ydW5uaW5nICkKPiAtICAgICAgICB2Y3B1X21pZ3Jh
dGVfc3RhcnQodik7Cj4gKyAgICBpZiAoIHYgIT0gY3VycmVudCApCj4gKyAgICAgICAgdmNwdV9w
YXVzZSh2KTsKPiArICAgIGVsc2UKPiArICAgICAgICBzdG9wX3RpbWVyKCZ2LT5wZXJpb2RpY190
aW1lcik7Cj4gIAo+IC0gICAgaXRlbV9zY2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIHYtPnNjaGVk
X2l0ZW0pOwo+ICsgICAgdi0+cGVyaW9kaWNfcGVyaW9kID0gdmFsdWU7Cj4gKyAgICB2LT5wZXJp
b2RpY19sYXN0X2V2ZW50ID0gbm93OwoKQnkgdGhlIHRpbWUgeW91IGNvbWUgaGVyZSwgTk9XKCkg
bWF5IGFscmVhZHkgYmUgcGFzdCBub3cgKyB2YWx1ZS4KSXQncyBub3QgY2xlYXIgdG8gbWUgd2hl
dGhlciB0aGF0J2xsIHdvcmsgY29ycmVjdGx5OyBJIHRoaW5rIGl0IHdvdWxkIGJlCmJldHRlciB0
byBsYXRjaCBOT1coKSBvbmx5IGF0IHRoaXMgcG9pbnQuCgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
