From: "Guan Xuetao" <gxt@mprc.pku.edu.cn>
Subject: Re: Maintainers,
 please tell us how to boot your machines!
Date: Thu, 28 Mar 2019 21:57:06 +0800 (GMT+08:00)
Message-ID: <2c0bc4bf.2d83.169c4970a80.Coremail.gxt__45463.2358554349$1553782328$gmane$org@mprc.pku.edu.cn>
References: <87d0mwatbu.fsf@dusky.pond.sub.org>
 <875zsed86y.fsf@dusky.pond.sub.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9H75=R7=mprc.pku.edu.cn=gxt@srs-us1.protection.inumbo.net>)
 id 1h9VjL-0004CR-9o
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2019 14:10:07 +0000
In-Reply-To: <875zsed86y.fsf@dusky.pond.sub.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: markus armbruster <armbru@redhat.com>
Cc: peter maydell <peter.maydell@linaro.org>, anthony green <green@moxielogic.com>, qemu-devel@nongnu.org, "edgar e. iglesias" <edgar.iglesias@gmail.com>, marek vasut <marex@denx.de>, stefano stabellini <sstabellini@kernel.org>, aleksandar rikalo <arikalo@wavecomp.com>, alexander graf <agraf@suse.de>, =?UTF-8?Q?herv=C3=A9_poussineau?= <hpoussin@reactos.org>, anthony perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, andrzej zaborowski <balrogg@gmail.com>, paul durrant <paul.durrant@citrix.com>, jan kiszka <jan.kiszka@web.de>, igor mitsyanko <i.mitsyanko@gmail.com>, bastian koppelmann <kbastian@mail.uni-paderborn.de>, chris wulff <crwulff@gmail.com>, jean-christophe dubois <jcd@tribudubois.net>, andrey smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, aleksandar markovic <amarkovic@wavecomp.com>, aurelien jarno <aurelien@aurel32.ne>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2VzLS0tLS0KPiBGcm9tOiAiTWFya3VzIEFybWJydXN0ZXIi
IDxhcm1icnVAcmVkaGF0LmNvbT4KPiBTZW50IFRpbWU6IDIwMTktMDMtMjAgMDI6MzQ6NDUgKFdl
ZG5lc2RheSkKPiBUbzogcWVtdS1kZXZlbEBub25nbnUub3JnCj4gQ2M6ICJFZGdhciBFLiBJZ2xl
c2lhcyIgPGVkZ2FyLmlnbGVzaWFzQGdtYWlsLmNvbT4sICJIZXJ2w6kgUG91c3NpbmVhdSIgPGhw
b3Vzc2luQHJlYWN0b3Mub3JnPiwgIkFsZWtzYW5kYXIgTWFya292aWMiIDxhbWFya292aWNAd2F2
ZWNvbXAuY29tPiwgIkFsZWtzYW5kYXIgUmlrYWxvIiA8YXJpa2Fsb0B3YXZlY29tcC5jb20+LCAi
QWxleGFuZGVyIEdyYWYiIDxhZ3JhZkBzdXNlLmRlPiwgIkFuZHJleSBTbWlybm92IiA8YW5kcmV3
LnNtaXJub3ZAZ21haWwuY29tPiwgIkFuZHJ6ZWogWmFib3Jvd3NraSIgPGJhbHJvZ2dAZ21haWwu
Y29tPiwgIkFudGhvbnkgR3JlZW4iIDxncmVlbkBtb3hpZWxvZ2ljLmNvbT4sICJBbnRob255IFBl
cmFyZCIgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+LCAiQXVyZWxpZW4gSmFybm8iIDxhdXJl
bGllbkBhdXJlbDMyLm5ldD4sICJCYXN0aWFuIEtvcHBlbG1hbm4iIDxrYmFzdGlhbkBtYWlsLnVu
aS1wYWRlcmJvcm4uZGU+LCAiQ2hyaXMgV3VsZmYiIDxjcnd1bGZmQGdtYWlsLmNvbT4sICJHdWFu
IFh1ZXRhbyIgPGd4dEBtcHJjLnBrdS5lZHUuY24+LCAiSWdvciBNaXRzeWFua28iIDxpLm1pdHN5
YW5rb0BnbWFpbC5jb20+LCAiSmFuIEtpc3prYSIgPGphbi5raXN6a2FAd2ViLmRlPiwgIkplYW4t
Q2hyaXN0b3BoZSBEdWJvaXMiIDxqY2RAdHJpYnVkdWJvaXMubmV0PiwgIk1hcmVrIFZhc3V0IiA8
bWFyZXhAZGVueC5kZT4sICJQYXVsIER1cnJhbnQiIDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4s
ICJQZXRlciBNYXlkZWxsIiA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPiwgIlN0ZWZhbm8gU3Rh
YmVsbGluaSIgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+LCBxZW11LWFybUBub25nbnUub3JnLCBx
ZW11LXBwY0Bub25nbnUub3JnLCB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBTdWJq
ZWN0OiBSZTogTWFpbnRhaW5lcnMsIHBsZWFzZSB0ZWxsIHVzIGhvdyB0byBib290IHlvdXIgbWFj
aGluZXMhCj4gCj4gWy4uLl0KPiAKPiBNYWNoaW5lcyB3aXRoIG5vIHN1cHBvcnRlciwgYnV0IGF0
IGxlYXN0IG9uZSBtYWludGFpbmVyOgo+IAo+ICAgICBbLi4uXQo+IAo+ICAgICA9IGh3L3VuaWNv
cmUzMi9wdXYzLmMgPQo+ICAgICBHdWFuIFh1ZXRhbyA8Z3h0QG1wcmMucGt1LmVkdS5jbj4gKG1h
aW50YWluZXI6VW5pQ29yZTMyKQo+IAo+IAo+IFRhcmdldHMgd2hlcmUgd2UgaGF2ZSByZWNlaXZl
ZCBpbmZvcm1hdGlvbiBmb3IgKm5vKiBtYWNoaW5lIHNvIGZhcjoKPiAKPiAgICAgWy4uLl0KPiAg
ICAgdW5pY29yZQoKSSdtIGhlcmUuIE5vdyBJIGNhbiBmaW5hbGx5IGRlYWwgd2l0aCBteSBlbWFp
bCBhY2NvdW50IDxneHRAbXByYy5wa3UuZWR1LmNuPiBhZnRlciBzZXZlcmFsIHllYXJzIGNoYW9z
LgpBbnl3YXksIHNvcnJ5IGZvciBzbyBsYXRlLgoKVG8gYm9vdCB1bmljb3JlMzIgbWFjaGluZSwg
Zm9sbG93aW5nIGNvbW1hbmRzIGFyZSB0ZXN0ZWQgaW4gYnJhbmNoIHN0YWJsZS0yLjc6CgpUbyBj
b25maWd1cmUgdW5pY29yZTMyIHRhcmdldDoKIC4vY29uZmlndXJlICAgICAtLXRhcmdldC1saXN0
PXVuaWNvcmUzMi1zb2Z0bW11ICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICAgICAgICAg
ICAgICAtLWVuYWJsZS1kZWJ1ZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwKICAgICAgICAgICAgICAgICAtLWRpc2FibGUtc2RsICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKICAgICAgICAgICAgICAgICAtLWVuYWJsZS1jdXJzZXMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICAgICAgICAgICAg
ICAtLWV4dHJhLWNmbGFncz0iLUQgcmVzdHJpY3Q9cmVzdHJpY1QiICAgICAgICAgICAgICAgICAg
IFwKClRvIHJ1biBhIHNpbXBsZSBidXN5Ym94IGltYWdlIG9uIHFlbXUtZGVmY29uZmlnIGtlcm5l
bDoKIC4vcWVtdS1zeXN0ZW0tdW5pY29yZTMyIC1jdXJzZXMgLU0gcHV2MyAtbSA1MTIgLWljb3Vu
dCAwIC1rZXJuZWwgc29tZWRpci96SW1hZ2UKIApQbGVhc2UgY2hlY2sgZ2l0aHViIGZvciBtb3Jl
IGRldGFpbHM6IGh0dHBzOi8vZ2l0aHViLmNvbS9neHQvVW5pQ29yZTMyCgpUaGFua3MsCkd1YW4g
WHVldGFvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
