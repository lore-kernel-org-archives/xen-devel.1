From: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 0/9] drm/xen-front: Add support for Xen PV
 display frontend
Date: Thu, 1 Mar 2018 09:26:48 +0100
Message-ID: <20180301082648.frnslqyhffj2bkwl__39878.2707671218$1519892739$gmane$org@sirius.home.kraxel.org>
References: <1519200222-20623-1-git-send-email-andr2000@gmail.com>
 <4c7e6f65-1787-3815-22b5-f9495e388c06@gmail.com>
 <7e265c53-db9a-0946-6b1c-b946bcbb4100@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=rhm8=fx=redhat.com=kraxel@srs-us1.protection.inumbo.net>)
 id 1erJYC-0000zz-Is
 for xen-devel@lists.xenproject.org; Thu, 01 Mar 2018 08:26:52 +0000
Content-Disposition: inline
In-Reply-To: <7e265c53-db9a-0946-6b1c-b946bcbb4100@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: jgross@suse.com, airlied@linux.ie, gustavo@padovan.org, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, seanpaul@chromium.org, daniel.vetter@intel.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

ICBIaSwKCj4gMS4gUG9zc2libGUgc2VjdXJpdHkgaXNzdWVzIC0gVmlydElPIGRldmljZXMgYXJl
IFBDSSBidXMgbWFzdGVycywgdGh1cwo+IGFsbG93aW5nIHJlYWwgZGV2aWNlIChydW5uaW5nLCBm
b3IgZXhhbXBsZSwgaW4gdW50cnVzdGVkIGRyaXZlciBkb21haW4pCj4gdG8gZ2V0IGNvbnRyb2wg
b3ZlciBndWVzdCdzIG1lbW9yeSBieSB3cml0aW5nIHRvIGl0cyBtZW1vcnkKPgo+IDIuIFZpcnRJ
TyBjdXJyZW50bHkgdXNlcyBHRk5zIHdyaXR0ZW4gaW50byB0aGUgc2hhcmVkIHJpbmcsIHdpdGhv
dXQgWGVuCj4gZ3JhbnRzIHN1cHBvcnQuIFRoaXMgd2lsbCByZXF1aXJlIGdlbmVyaWMgZ3JhbnQt
bWFwcGluZy9zaGFyaW5nIGxheWVyCj4gdG8gYmUgYWRkZWQgdG8gVmlydElPLgo+IAo+IDMuIFZp
cnRJTyByZXF1aXJlcyBRRU1VIFBDSSBlbXVsYXRpb24gZm9yIHNldHRpbmcgdXAgYSBkZXZpY2Uu
IFhlbiBQVgo+IChhbmQgUFZIKSBkb21haW5zIGRvbid0IHVzZSBRRU1VIGZvciBwbGF0Zm9ybSBl
bXVsYXRpb24gaW4gb3JkZXIgdG8KPiByZWR1Y2UgYXR0YWNrIHN1cmZhY2UuICAoUFZIIGlzIGlu
IHRoZSBwcm9jZXNzIG9mIGdhaW5pbmcgUENJIGNvbmZpZwo+IHNwYWNlIGVtdWxhdGlvbiB0aG91
Z2gsIGJ1dCBpdCBpcyBvcHRpb25hbCwgbm90IGEgcmVxdWlyZW1lbnQpCgpXZWxsLCB0aGF0IGlz
IHdyb25nLiAgdmlydGlvIGRvZXNuJ3QgcmVxdWlyZSBwY2kuICBUaGVyZSBhcmUgb3RoZXIKdHJh
bnNwb3J0cyAobW1pbywgY2N3KSwgYW5kIGl0IHNob3VsZCBiZSBwb3NzaWJsZSB0byBjcmVhdGUg
YSB4ZW4Kc3BlY2lmaWMgdHJhbnNwb3J0IHdoaWNoIHVzZXMgZ3JhbnQgdGFibGVzIHByb3Blcmx5
LiAgU2VlbXMgdGhlcmUgZXZlbgp3YXMgYW4gYXR0ZW1wdCB0byBpbXBsZW1lbnQgdGhhdCBpbiAy
MDExLCBzZWUgCmh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL1ZpcnRpb19Pbl9YZW4K
Cj4gNC4gTW9zdCBvZiB0aGUgUFYgZHJpdmVycyBhIGd1ZXN0IHVzZXMgYXQgdGhlIG1vbWVudCBh
cmUgWGVuIFBWIGRyaXZlcnMsCj4gZS5nLiBuZXQsCj4gYmxvY2ssIGNvbnNvbGUsIHNvIG9ubHkg
dmlydGlvLWdwdSB3aWxsIHJlcXVpcmUgUUVNVSB0byBydW4uCgpZb3UgYXJlIG5vdCBmb3JjZWQg
dG8gdXNlIHFlbXUsIHlvdSBjYW4gY2VydGFpbmx5IGNyZWF0ZSBhbiBhbHRlcm5hdGl2ZQpob3N0
IHNpZGUgaW1wbGVtZW50YXRpb24gKGFuZCBzdGlsbCB1c2Ugb24gdGhlIGV4aXN0aW5nIHZpcnRp
byBndWVzdApkcml2ZXJzKS4KCldoZW5ldmVyIHdyaXRpbmcgYSB4ZW5idXMgaW1wbGVtZW50YXRp
b24gZm9yIGJvdGggZ3Vlc3QgYW5kIGhvc3Qgb3IKd3JpdGluZyBhIHZpcnRpbyBpbXBsZW1lbnRh
dGlvbiBmb3IgdGhlIGhvc3Qgb25seSBpcyBiZXR0ZXIgLS0gZHVubm8uClRoZSB2aXJ0aW8gcGF0
aCBvYnZpb3VzbHkgbmVlZHMgc29tZSBpbmZyYXN0cnVjdHVyZSB3b3JrIGZvciB2aXJ0aW8Kc3Vw
cG9ydCBpbiBYZW4sIHdoaWNoIG1heSBwYXkgb2ZmIGxvbmcgdGVybS4gIFlvdXIgY2FsbC4KCmNo
ZWVycywKICBHZXJkCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
