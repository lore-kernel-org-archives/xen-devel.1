From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 6/8] viridian: separate time related
 enlightenment implementations...
Date: Tue, 30 Oct 2018 17:08:09 +0000
Message-ID: <e827bf8c3e484ea4b33c965ae3771c81@AMSPEX02CL03.citrite.net>
References: <20181029180211.2155-1-paul.durrant@citrix.com>
 <20181029180211.2155-9-paul.durrant@citrix.com>
 <20181030170320.6jie6ta6uoece7nr@mac.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kzyf=nk=citrix.com=prvs=834dfdc47=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gHXVg-0002YD-PE
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 17:08:56 +0000
In-Reply-To: <20181030170320.6jie6ta6uoece7nr@mac.citrite.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFJvZ2VyIFBhdSBNb25uZQo+IFNl
bnQ6IDMwIE9jdG9iZXIgMjAxOCAxNzowMwo+IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFu
dEBjaXRyaXguY29tPgo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IEFuZHJl
dyBDb29wZXIKPiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdlaS5saXUy
QGNpdHJpeC5jb20+OyBKYW4gQmV1bGljaAo+IDxqYmV1bGljaEBzdXNlLmNvbT4KPiBTdWJqZWN0
OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIDYvOF0gdmlyaWRpYW46IHNlcGFyYXRlIHRpbWUgcmVs
YXRlZAo+IGVubGlnaHRlbm1lbnQgaW1wbGVtZW50YXRpb25zLi4uCj4gCj4gT24gTW9uLCBPY3Qg
MjksIDIwMTggYXQgMDY6MDI6MDlQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+ID4gQEAg
LTE1NCw2ICsxNDUsMTQgQEAgdmlyaWRpYW5faHlwZXJjYWxsKHN0cnVjdCBjcHVfdXNlcl9yZWdz
ICpyZWdzKTsKPiA+ICB2b2lkIHZpcmlkaWFuX3RpbWVfcmVmX2NvdW50X2ZyZWV6ZShzdHJ1Y3Qg
ZG9tYWluICpkKTsKPiA+ICB2b2lkIHZpcmlkaWFuX3RpbWVfcmVmX2NvdW50X3RoYXcoc3RydWN0
IGRvbWFpbiAqZCk7Cj4gPgo+ID4gK2ludCB2aXJpZGlhbl90aW1lX3dybXNyKHN0cnVjdCB2Y3B1
ICp2LCB1aW50MzJfdCBpZHgsIHVpbnQ2NF90IHZhbCk7Cj4gPiAraW50IHZpcmlkaWFuX3RpbWVf
cmRtc3IoY29uc3Qgc3RydWN0IHZjcHUgKnYsIHVpbnQzMl90IGlkeCwgdWludDY0X3QKPiAqdmFs
KTsKPiA+ICsKPiA+ICt2b2lkIHZpcmlkaWFuX3RpbWVfc2F2ZV9kb21haW5fY3R4dCgKPiA+ICsg
ICAgY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGh2bV92aXJpZGlhbl9kb21haW5fY29u
dGV4dCAqY3R4dCk7Cj4gPiArdm9pZCB2aXJpZGlhbl90aW1lX2xvYWRfZG9tYWluX2N0eHQoCj4g
PiArICAgIHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBodm1fdmlyaWRpYW5fZG9tYWluX2NvbnRl
eHQgKmN0eHQpOwo+IAo+IENhbiBjdHh0IGJlIGNvbnN0aWZ5ZWQgaW4gdGhlIGxvYWQgY2FzZT8K
CkkgZ3Vlc3MgaXQgY291bGQgYmUsIHllcy4KCiAgUGF1bAoKPiAKPiBUaGFua3MsIFJvZ2VyLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
