From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 8/8] xen: Swich parameter in
 get_page_from_gfn to use typesafe gfn
Date: Mon, 12 Nov 2018 16:52:26 +0000
Message-ID: <f6b0a222-573d-c49c-52d6-93b3c9e52679@arm.com>
References: <20181106191454.22143-1-julien.grall@arm.com>
 <20181106191454.22143-9-julien.grall@arm.com>
 <CAC1WxdgJTv6KuJFahYScDDWqHNz7iu21BV7ep5thtcwXxUCVEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kbrj=nx=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gMFRx-0002ea-9n
 for xen-devel@lists.xenproject.org; Mon, 12 Nov 2018 16:52:33 +0000
In-Reply-To: <CAC1WxdgJTv6KuJFahYScDDWqHNz7iu21BV7ep5thtcwXxUCVEw@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: kevin.tian@intel.com, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, jun.nakajima@intel.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, "Tim (Xen.org)" <tim@xen.org>, julie.grall@arm.com, Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul.durrant@citrix.com>, suravee.suthikulpanit@amd.com, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, brian.woods@amd.com
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMS8xMi8xOCA0OjQ5IFBNLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEhlbGxvIEp1bGll
biwKCkhpLAoKPiAKPiBJJ20ganVzdCB3b25kZXJpbmcgaWYgdGhpcyBwYXRjaCByZWFsbHkgYmVs
b25ncyB0byB4ZW50cmFjZcKgc2VyaWVzLgo+IEl0IHJhdGhlciBsb29rcyBsaWtlIGEgc2VwYXJh
dGUgY2xlYW51cCBwYXRjaC4KCldoYXQncyB3cm9uZyB3aXRoIGluY2x1ZGluZyBjbGVhbi11cCBw
YXRjaCBpbiBhIHNlcmllcyBhZGRpbmcgYSBmZWF0dXJlPwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBH
cmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
