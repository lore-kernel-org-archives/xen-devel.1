From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86emul: add support for missing {,
 V}PMADDWD insns
Date: Wed, 15 May 2019 02:23:37 -0600
Message-ID: <5CDBCC89020000780022F1DE@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LpR9=TP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQpCP-0003FC-PR
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 08:23:41 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlaXIgcHJlLUFWWDUxMiBpbmNhcm5hdGlvbnMgaGF2ZSBjbGVhcmx5IGJlZW4gb3Zlcmxvb2tl
ZCBkdXJpbmcgbXVjaAplYXJsaWVyIHdvcmsuIFRoZWlyIG1lbW9yeSBhY2Nlc3MgcGF0dGVybiBp
cyBlbnRpcmVseSBzdGFuZGFyZCwgc28gbm8Kc3BlY2lmaWMgdGVzdHMgZ2V0IGFkZGVkIHRvIHRo
ZSBoYXJuZXNzLgoKUmVwb3J0ZWQtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRl
ZmVuZGVyLmNvbT4KU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgoKLS0tIGEveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKKysrIGIveGVu
L2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKQEAgLTY2MjQsNiArNjYyNCw4IEBA
IHg4Nl9lbXVsYXRlKAogICAgIGNhc2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4MGYsIDB4ZjMpOiAv
KiB2cHNsbHEgeG1tL20xMjgse3gseX1tbSx7eCx5fW1tICovCiAgICAgY2FzZSBYODZFTVVMX09Q
Q182NigweDBmLCAweGY0KTogICAgIC8qIHBtdWx1ZHEgeG1tL20xMjgseG1tICovCiAgICAgY2Fz
ZSBYODZFTVVMX09QQ19WRVhfNjYoMHgwZiwgMHhmNCk6IC8qIHZwbXVsdWRxIHt4LHl9bW0vbWVt
LHt4LHl9bW0se3gseX1tbSAqLworICAgIENBU0VfU0lNRF9QQUNLRURfSU5UKDB4MGYsIDB4ZjUp
OiAgICAvKiBwbWFkZHdkIHsseH1tbS9tZW0seyx4fW1tICovCisgICAgY2FzZSBYODZFTVVMX09Q
Q19WRVhfNjYoMHgwZiwgMHhmNSk6IC8qIHZwbWFkZHdkIHt4LHl9bW0vbWVtLHt4LHl9bW0se3gs
eX1tbSAqLwogICAgIGNhc2UgWDg2RU1VTF9PUENfNjYoMHgwZiwgMHhmNik6ICAgICAvKiBwc2Fk
YncgeG1tL20xMjgseG1tICovCiAgICAgY2FzZSBYODZFTVVMX09QQ19WRVhfNjYoMHgwZiwgMHhm
Nik6IC8qIHZwc2FkYncge3gseX1tbS9tZW0se3gseX1tbSx7eCx5fW1tICovCiAgICAgQ0FTRV9T
SU1EX1BBQ0tFRF9JTlQoMHgwZiwgMHhmOCk6ICAgIC8qIHBzdWJiIHsseH1tbS9tZW0seyx4fW1t
ICovCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
