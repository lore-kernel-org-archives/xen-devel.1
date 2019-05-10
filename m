From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/5] pci: use pci_sbdf_t in pci_dev
Date: Fri, 10 May 2019 17:16:55 +0100
Message-ID: <bbca70d1-a42e-f016-26aa-fc7cd15bbf24@citrix.com>
References: <20190510161056.48648-1-roger.pau@citrix.com>
 <20190510161056.48648-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KsvH=TK=citrix.com=prvs=026b205b0=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hP8Ci-0005Eb-GO
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 16:17:00 +0000
In-Reply-To: <20190510161056.48648-2-roger.pau@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMDUvMjAxOSAxNzoxMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC94ODYvaHZtL3Ztc2kuYyBiL3hlbi9hcmNoL3g4Ni9odm0vdm1zaS5jCj4gaW5k
ZXggYWViNWE3MDEwNC4uMTVjZmU4ZDA1NyAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZt
L3Ztc2kuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm1zaS5jCj4gQEAgLTY4OCw4ICs2ODgs
OCBAQCBzdGF0aWMgaW50IHZwY2lfbXNpX3VwZGF0ZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRl
diwgdWludDMyX3QgZGF0YSwKPiAgICAgICAgICB7Cj4gICAgICAgICAgICAgIGdkcHJpbnRrKFhF
TkxPR19FUlIsCj4gICAgICAgICAgICAgICAgICAgICAgICIlMDR4OiUwMng6JTAyeC4ldTogZmFp
bGVkIHRvIGJpbmQgUElSUSAldTogJWRcbiIsCj4gLSAgICAgICAgICAgICAgICAgICAgIHBkZXYt
PnNlZywgcGRldi0+YnVzLCBQQ0lfU0xPVChwZGV2LT5kZXZmbiksCj4gLSAgICAgICAgICAgICAg
ICAgICAgIFBDSV9GVU5DKHBkZXYtPmRldmZuKSwgcGlycSArIGksIHJjKTsKPiArICAgICAgICAg
ICAgICAgICAgICAgcGRldi0+c2JkZi5zZWcsIHBkZXYtPnNiZGYuYnVzLCBwZGV2LT5zYmRmLmRl
diwKPiArICAgICAgICAgICAgICAgICAgICAgcGRldi0+c2JkZi5mdW5jLCBwaXJxICsgaSwgcmMp
OwoKQSBwY2lfc2JkZl90IGlzIDMyIGJpdHMgd2lkZS7CoCBJIGRvIGFjdHVhbGx5IGhhdmUgYSBj
dXN0b20gJXAgZm9ybWF0dGVyCmZyb20gYSB5ZWFyIG9yIHNvIGFnbywgd2hpY2ggc2ltcGxpZmll
cyBjb2RlIGxpa2UgdGhpcyBzdWJzdGFudGlhbGx5LgoKSXMgdGhlcmUgYW55IGludGVyZXN0IGlu
IGR1c3Rpbmcgb2ZmIHRoYXQgcGF0Y2ggYW5kIGZvbGRpbmcgaXQgaW50byB0aGlzCmNsZWFudXAg
c2VyaWVzP8KgIElTVFIgaXQgYWxzbyBjYW1lIHdpdGggc2V2ZXJhbCBjb3JyZWN0aW9ucyB0byBl
eGlzdGluZwpTQkRGIHJlbmRlcmluZy4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
