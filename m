From: Milan Boberic <milanboberic94@gmail.com>
Subject: Re: Xen optimization
Date: Mon, 29 Oct 2018 13:29:34 +0100
Message-ID: <CADJ6SV174NdceJ4kWCWYJ-UaNp1AAisb28V5tgKz14N+-pBVEg@mail.gmail.com>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
 <CADJ6SV3jk=nnP=6T8R+OuvJH2uQ6uBrLmvudAHkKHP+mN-3hPA@mail.gmail.com>
 <e0f4fe11-eeb0-3a28-2e7e-246a8f72da19@arm.com>
 <12a4352a-2fd1-2d04-874a-4a779d18a097@arm.com>
 <CADJ6SV0E=cO3eFyt+meXTtZaoETYxpsHkViMDU=XV9CwNOjP8A@mail.gmail.com>
 <21de0bb5-81f2-ca26-e2e0-916c20ab2c02@arm.com>
 <CADJ6SV3sfqaXm8gvZDAx2wFY5_oiCf+mf0JynCGNrLBFkS-rVw@mail.gmail.com>
 <alpine.DEB.2.10.1810191336090.31582@sstabellini-ThinkPad-X260>
 <d3a589c5d95d70ef1c13b4fe6856b7ed387b4ee3.camel@suse.com>
 <CADJ6SV2891kOd_Ga8jjXdtKdjPAoWtADhizuS+kjSZNNOPMK+w@mail.gmail.com>
 <alpine.DEB.2.10.1810221037270.31582@sstabellini-ThinkPad-X260>
 <CADJ6SV0gUvRv_4Kp=Vz5n4WSQ3kgQrC=+gPz1QjrBzdFOoJwPA@mail.gmail.com>
 <alpine.DEB.2.10.1810231005040.31582@sstabellini-ThinkPad-X260>
 <d5769cb9-9d87-3db4-e23d-414242692a89@arm.com>
 <alpine.DEB.2.10.1810250915030.25937@sstabellini-ThinkPad-X260>
 <94c08d07-b028-8eb1-7e94-21a416cd8007@arm.com>
 <alpine.DEB.2.10.1810261340530.32521@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="00000000000075de2a05795d39da"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=thnn=nj=gmail.com=milanboberic94@srs-us1.protection.inumbo.net>)
 id 1gH6g1-0003nb-H2
 for xen-devel@lists.xenproject.org; Mon, 29 Oct 2018 12:29:49 +0000
Received: by mail-lf1-x12c.google.com with SMTP id n26-v6so5869076lfl.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Oct 2018 05:29:47 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.10.1810261340530.32521@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: stefano.stabellini@xilinx.com
Cc: sstabellini@kernel.org, andrii_anisov@epam.com, Dario Faggioli <dfaggioli@suse.com>, julien.grall@arm.com, Meng Xu <xumengpanda@gmail.com>, xen-devel@lists.xenproject.org, nd@arm.com
List-Id: xen-devel@lists.xenproject.org

--00000000000075de2a05795d39da
Content-Type: text/plain; charset="UTF-8"

Sorry for late reply,

> I am afraid no. .config is generated during building time. So can you
> paste here please.


".config" file is in attachment.

I also tried Xen 4.9 and I got almost same numbers, jitter is smaller
by 150ns which isn't significant change at all.

Milan

--00000000000075de2a05795d39da
Content-Type: text/plain; charset="US-ASCII"; name=".config.txt"
Content-Disposition: attachment; filename=".config.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_jnua4n7i0>
X-Attachment-Id: f_jnua4n7i0

Iw0KIyBBdXRvbWF0aWNhbGx5IGdlbmVyYXRlZCBmaWxlOyBETyBOT1QgRURJVC4NCiMgWGVuL2Fy
bSA0LjExLjEtcHJlIENvbmZpZ3VyYXRpb24NCiMNCkNPTkZJR182NEJJVD15DQpDT05GSUdfQVJN
XzY0PXkNCkNPTkZJR19BUk09eQ0KQ09ORklHX0FSQ0hfREVGQ09ORklHPSJhcmNoL2FybS9jb25m
aWdzL2FybTY0X2RlZmNvbmZpZyINCg0KIw0KIyBBcmNoaXRlY3R1cmUgRmVhdHVyZXMNCiMNCkNP
TkZJR19OUl9DUFVTPTEyOA0KIyBDT05GSUdfQUNQSSBpcyBub3Qgc2V0DQpDT05GSUdfR0lDVjM9
eQ0KIyBDT05GSUdfSEFTX0lUUyBpcyBub3Qgc2V0DQojIENPTkZJR19ORVdfVkdJQyBpcyBub3Qg
c2V0DQpDT05GSUdfU0JTQV9WVUFSVF9DT05TT0xFPXkNCg0KIw0KIyBBUk0gZXJyYXRhIHdvcmth
cm91bmQgdmlhIHRoZSBhbHRlcm5hdGl2ZSBmcmFtZXdvcmsNCiMNCkNPTkZJR19BUk02NF9FUlJB
VFVNXzgyNzMxOT15DQpDT05GSUdfQVJNNjRfRVJSQVRVTV84MjQwNjk9eQ0KQ09ORklHX0FSTTY0
X0VSUkFUVU1fODE5NDcyPXkNCkNPTkZJR19BUk02NF9FUlJBVFVNXzgzMjA3NT15DQpDT05GSUdf
QVJNNjRfRVJSQVRVTV84MzQyMjA9eQ0KQ09ORklHX0hBUkRFTl9CUkFOQ0hfUFJFRElDVE9SPXkN
CkNPTkZJR19BUk02NF9IQVJERU5fQlJBTkNIX1BSRURJQ1RPUj15DQpDT05GSUdfQUxMX1BMQVQ9
eQ0KIyBDT05GSUdfUUVNVSBpcyBub3Qgc2V0DQojIENPTkZJR19SQ0FSMyBpcyBub3Qgc2V0DQoj
IENPTkZJR19NUFNPQyBpcyBub3Qgc2V0DQpDT05GSUdfQUxMNjRfUExBVD15DQojIENPTkZJR19B
TEwzMl9QTEFUIGlzIG5vdCBzZXQNCkNPTkZJR19NUFNPQ19QTEFURk9STT15DQoNCiMNCiMgQ29t
bW9uIEZlYXR1cmVzDQojDQpDT05GSUdfSEFTX0FMVEVSTkFUSVZFPXkNCkNPTkZJR19IQVNfREVW
SUNFX1RSRUU9eQ0KIyBDT05GSUdfTUVNX0FDQ0VTUyBpcyBub3Qgc2V0DQpDT05GSUdfSEFTX1BE
WD15DQpDT05GSUdfVE1FTT15DQojIENPTkZJR19YU00gaXMgbm90IHNldA0KDQojDQojIFNjaGVk
dWxlcnMNCiMNCkNPTkZJR19TQ0hFRF9DUkVESVQ9eQ0KQ09ORklHX1NDSEVEX0NSRURJVDI9eQ0K
Q09ORklHX1NDSEVEX1JURFM9eQ0KIyBDT05GSUdfU0NIRURfQVJJTkM2NTMgaXMgbm90IHNldA0K
Q09ORklHX1NDSEVEX05VTEw9eQ0KQ09ORklHX1NDSEVEX0NSRURJVF9ERUZBVUxUPXkNCiMgQ09O
RklHX1NDSEVEX0NSRURJVDJfREVGQVVMVCBpcyBub3Qgc2V0DQojIENPTkZJR19TQ0hFRF9SVERT
X0RFRkFVTFQgaXMgbm90IHNldA0KIyBDT05GSUdfU0NIRURfTlVMTF9ERUZBVUxUIGlzIG5vdCBz
ZXQNCkNPTkZJR19TQ0hFRF9ERUZBVUxUPSJjcmVkaXQiDQojIENPTkZJR19MSVZFUEFUQ0ggaXMg
bm90IHNldA0KQ09ORklHX1NVUFBSRVNTX0RVUExJQ0FURV9TWU1CT0xfV0FSTklOR1M9eQ0KQ09O
RklHX0NNRExJTkU9IiINCg0KIw0KIyBEZXZpY2UgRHJpdmVycw0KIw0KQ09ORklHX0hBU19OUzE2
NTUwPXkNCkNPTkZJR19IQVNfQ0FERU5DRV9VQVJUPXkNCkNPTkZJR19IQVNfTVZFQlU9eQ0KQ09O
RklHX0hBU19QTDAxMT15DQpDT05GSUdfSEFTX1NDSUY9eQ0KQ09ORklHX0hBU19QQVNTVEhST1VH
SD15DQpDT05GSUdfQVJNX1NNTVU9eQ0KQ09ORklHX1ZJREVPPXkNCkNPTkZJR19IQVNfQVJNX0hE
TENEPXkNCkNPTkZJR19ERUZDT05GSUdfTElTVD0iJEFSQ0hfREVGQ09ORklHIg0KDQojDQojIERl
YnVnZ2luZyBPcHRpb25zDQojDQojIENPTkZJR19ERUJVRyBpcyBub3Qgc2V0DQojIENPTkZJR19G
UkFNRV9QT0lOVEVSIGlzIG5vdCBzZXQNCiMgQ09ORklHX0NPVkVSQUdFIGlzIG5vdCBzZXQNCiMg
Q09ORklHX0xPQ0tfUFJPRklMRSBpcyBub3Qgc2V0DQojIENPTkZJR19QRVJGX0NPVU5URVJTIGlz
IG5vdCBzZXQNCiMgQ09ORklHX1ZFUkJPU0VfREVCVUcgaXMgbm90IHNldA0KIyBDT05GSUdfREVW
SUNFX1RSRUVfREVCVUcgaXMgbm90IHNldA0KIyBDT05GSUdfU0NSVUJfREVCVUcgaXMgbm90IHNl
dA==
--00000000000075de2a05795d39da
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--00000000000075de2a05795d39da--
