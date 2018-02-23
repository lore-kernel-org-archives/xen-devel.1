From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 4/9] drm/xen-front: Implement Xen event
	channel handling
Date: Fri, 23 Feb 2018 09:44:43 -0500
Message-ID: <7d8ab151-e90d-baef-93b6-8ca1c7e42908@oracle.com>
References: <1519200222-20623-1-git-send-email-andr2000@gmail.com>
 <1519200222-20623-5-git-send-email-andr2000@gmail.com>
 <395cdaef-db7e-139c-bbf1-28cb33f41f58@oracle.com>
 <5145287f-40b0-c8e2-1b37-36d7e8cac908@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=q2tv=fr=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1epEaF-0007IE-2Y
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 14:44:23 +0000
In-Reply-To: <5145287f-40b0-c8e2-1b37-36d7e8cac908@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, airlied@linux.ie, daniel.vetter@intel.com, seanpaul@chromium.org, gustavo@padovan.org, jgross@suse.com, konrad.wilk@oracle.com
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjMvMjAxOCAwMjowMCBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4g
T24gMDIvMjMvMjAxOCAwMTo1MCBBTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+PiBPbiAwMi8y
MS8yMDE4IDAzOjAzIEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4+ICsKPj4+
ICtzdGF0aWMgaXJxcmV0dXJuX3QgZXZ0Y2hubF9pbnRlcnJ1cHRfY3RybChpbnQgaXJxLCB2b2lk
ICpkZXZfaWQpCj4+PiArewo+Pj4gKyAgICBzdHJ1Y3QgeGVuX2RybV9mcm9udF9ldnRjaG5sICpl
dnRjaG5sID0gZGV2X2lkOwo+Pj4gKyAgICBzdHJ1Y3QgeGVuX2RybV9mcm9udF9pbmZvICpmcm9u
dF9pbmZvID0gZXZ0Y2hubC0+ZnJvbnRfaW5mbzsKPj4+ICsgICAgc3RydWN0IHhlbmRpc3BsX3Jl
c3AgKnJlc3A7Cj4+PiArICAgIFJJTkdfSURYIGksIHJwOwo+Pj4gKyAgICB1bnNpZ25lZCBsb25n
IGZsYWdzOwo+Pj4gKwo+Pj4gKyAgICBzcGluX2xvY2tfaXJxc2F2ZSgmZnJvbnRfaW5mby0+aW9f
bG9jaywgZmxhZ3MpOwo+Pj4gKwo+Pj4gKyAgICBpZiAodW5saWtlbHkoZXZ0Y2hubC0+c3RhdGUg
IT0gRVZUQ0hOTF9TVEFURV9DT05ORUNURUQpKQo+Pj4gKyAgICAgICAgZ290byBvdXQ7Cj4+IERv
IHlvdSBuZWVkIHRvIGNoZWNrIHRoZSBzdGF0ZSB1bmRlciBsb2NrPyAoaW4gb3RoZXIgcm91dGlu
ZXMgdG9vKS4KPiBub3QgcmVhbGx5LCB3aWxsIG1vdmUgb3V0IG9mIHRoZSBsb2NrIGluIGludGVy
cnVwdCBoYW5kbGVycwo+IG90aGVyIHBsYWNlcyAoSSBhc3N1bWUgeW91IHJlZmVyIHRvIGJlX3N0
cmVhbV9kb19pbykKCgpJIHdhcyBtb3N0bHkgcmVmZXJyaW5nIHRvIGV2dGNobmxfaW50ZXJydXB0
X2V2dCgpLgoKLWJvcmlzCgoKPiBpdCBpcyBzZXQgdW5kZXIgbG9jayBhcyBhIHBhcnQgb2YgYXRv
bWljIG9wZXJhdGlvbiwgZS5nLgo+IHdlIGdldCBhIG5ldyByZXF1ZXN0IHBvaW50ZXIgZnJvbSB0
aGUgcmluZyBhbmQgcmVzZXQgY29tcGxldGlvbgo+IFNvLCB0aG9zZSBwbGFjZXMgc3RpbGwgc2Vl
bSB0byBiZSBvawoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
