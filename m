From: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 03/11] xen: defer call to xen_restrict until
 just before os_setup_post
Date: Thu, 8 Mar 2018 17:03:45 -0300
Message-ID: <20180308200345.GD3417@localhost.localdomain>
References: <1520530757-4477-1-git-send-email-ian.jackson@eu.citrix.com>
 <1520530757-4477-4-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=dpt/=f6=redhat.com=ehabkost@srs-us1.protection.inumbo.net>)
 id 1eu1lb-0003hG-Sn
 for xen-devel@lists.xenproject.org; Thu, 08 Mar 2018 20:03:55 +0000
Content-Disposition: inline
In-Reply-To: <1520530757-4477-4-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Ross Lagerwall <ross.lagerwall@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXIgMDgsIDIwMTggYXQgMDU6Mzk6MDlQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6ClsuLi5dCj4gZGlmZiAtLWdpdCBhL3ZsLmMgYi92bC5jCj4gaW5kZXggZGFlOTg2Yi4uZTZl
OGUxZSAxMDA2NDQKPiAtLS0gYS92bC5jCj4gKysrIGIvdmwuYwo+IEBAIC00NzE5LDYgKzQ3MTks
NyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YsIGNoYXIgKiplbnZwKQo+ICAgICAg
ICAgIHZtX3N0YXJ0KCk7Cj4gICAgICB9Cj4gIAo+ICsgICAgeGVuX3NldHVwX3Bvc3QoKTsKCkkg
ZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIGhhdmUgYWNjZWxlcmF0b3Itc3BlY2lmaWMgY29kZSBpbiBt
YWluKCksCmlmIHdlIGFscmVhZHkgaGF2ZSBhY2NlbGVyYXRvciBjbGFzc2VzIHRoYXQgY2FuIGFi
c3RyYWN0IHRoYXQKb3V0LiAgSSBzdWdnZXN0IGFkZGluZyBhIEFjY2VsQ2xhc3M7OnNldHVwX3Bv
c3QoKSBtZXRob2QgdGhhdCBjYW4KYmUgY2FsbGVkIGhlcmUuCgotLSAKRWR1YXJkbwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
