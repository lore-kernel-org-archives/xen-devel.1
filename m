From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 0/5] Handle jobs that depend on
 identically-named jobs
Date: Tue, 12 Jun 2018 17:39:08 +0100
Message-ID: <1528821553-27252-1-git-send-email-ian.jackson@eu.citrix.com>
References: <23327.63003.13831.988297@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hfe/=i6=citrix.com=prvs=694d9f8cf=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fSmKc-0005kv-JZ
 for xen-devel@lists.xenproject.org; Tue, 12 Jun 2018 16:39:42 +0000
In-Reply-To: <23327.63003.13831.988297@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+CgpJYW4gSmFja3Nv
biAoNSk6CiAgZGJfcmV0cnk6IEhvbm91ciBuZXcgT1NTVEVTVF9EQl9BTFdBWVNfQUJPUlQgdmFy
aWFibGUKICBjcy1iaXNlY3Rpb24tc3RlcDogSW1wcm92ZSBhIG1lc3NhZ2UKICBjcy1iaXNlY3Rp
b24tc3RlcDogUmVmYWN0b3IgJHN1YmpvYnMgY2FsY3VsYXRpb25zIGEgYml0CiAgY3MtYmlzZWN0
aW9uLXN0ZXA6IEhhbmRsZSBidWlsZCBqb2IgY2hhaW5zCiAgY3MtYmlzZWN0aW9uLXN0ZXA6IERv
IGV4cGxpY2l0bHkgc2V0IHJ1bnZhciBmb3Igc3VwcHJlc3NlZCByZWN1cnNpb24KCiBPc3N0ZXN0
LnBtICAgICAgICB8ICAyICsrCiBjcy1iaXNlY3Rpb24tc3RlcCB8IDQzICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKystLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMzkgaW5zZXJ0
aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCi0tIAoyLjEuNAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
