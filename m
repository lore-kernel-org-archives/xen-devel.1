From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 03/11] xen: defer call to xen_restrict until
 just before os_setup_post
Date: Fri, 9 Mar 2018 11:33:35 +0000
Message-ID: <23202.28943.344150.512881@mariner.uk.xensource.com>
References: <1520530757-4477-1-git-send-email-ian.jackson@eu.citrix.com>
 <1520530757-4477-4-git-send-email-ian.jackson@eu.citrix.com>
 <20180308200345.GD3417@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=gdq1=f7=citrix.com=prvs=5995bc012=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1euGHL-00006v-QM
 for xen-devel@lists.xenproject.org; Fri, 09 Mar 2018 11:33:39 +0000
In-Reply-To: <20180308200345.GD3417@localhost.localdomain>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Ross Lagerwall <ross.lagerwall@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

RWR1YXJkbyBIYWJrb3N0IHdyaXRlcyAoIlJlOiBbUEFUQ0ggMDMvMTFdIHhlbjogZGVmZXIgY2Fs
bCB0byB4ZW5fcmVzdHJpY3QgdW50aWwganVzdCBiZWZvcmUgb3Nfc2V0dXBfcG9zdCIpOgo+IE9u
IFRodSwgTWFyIDA4LCAyMDE4IGF0IDA1OjM5OjA5UE0gKzAwMDAsIElhbiBKYWNrc29uIHdyb3Rl
Ogo+IFsuLi5dCj4gPiBkaWZmIC0tZ2l0IGEvdmwuYyBiL3ZsLmMKPiA+ICsgICAgeGVuX3NldHVw
X3Bvc3QoKTsKPiAKPiBJIGRvbid0IHRoaW5rIHdlIHNob3VsZCBoYXZlIGFjY2VsZXJhdG9yLXNw
ZWNpZmljIGNvZGUgaW4gbWFpbigpLAo+IGlmIHdlIGFscmVhZHkgaGF2ZSBhY2NlbGVyYXRvciBj
bGFzc2VzIHRoYXQgY2FuIGFic3RyYWN0IHRoYXQKPiBvdXQuICBJIHN1Z2dlc3QgYWRkaW5nIGEg
QWNjZWxDbGFzczs6c2V0dXBfcG9zdCgpIG1ldGhvZCB0aGF0IGNhbgo+IGJlIGNhbGxlZCBoZXJl
LgoKSSB0aGluayBJIGNhbiBkbyB0aGF0LgoKQWx0aG91Z2gsIGl0IGlzIGEgYml0IGRpc2FwcG9p
bnRpbmcgdG8gYmUgZ2l2ZW4gdGhpcyBmZWVkYmFjayBpbiB2NiBvZgp0aGlzIHNlcmllcy4gIERp
ZCB0aGUgcmlnaHQgcGVvcGxlIG5vdCBnZXQgQ0MnZCBvbiB2NSBpbiBPY3RvYmVyID8KCklhbi4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
