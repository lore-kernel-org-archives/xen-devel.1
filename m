From: Jordan Justen <jordan.l.justen@intel.com>
Subject: Re: [edk2-devel] [PATCH v2 01/31]
 OvmfPkg/ResetSystemLib: Add missing dependency on PciLib
Date: Wed, 10 Apr 2019 02:16:54 -0700
Message-ID: <155488781468.19925.8808103067126994195@jljusten-skl>
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-2-anthony.perard@citrix.com>
 <9d0a2a9b-21b9-de51-c232-c6847d7b03b3@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sbnS=SM=intel.com=jordan.l.justen@srs-us1.protection.inumbo.net>)
 id 1hE9Lm-0002Qy-DM
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 09:16:58 +0000
In-Reply-To: <9d0a2a9b-21b9-de51-c232-c6847d7b03b3@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Laszlo Ersek <lersek@redhat.com>, anthony.perard@citrix.com, devel@edk2.groups.io
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOS0wNC0xMCAwMTo0ODozOSwgTGFzemxvIEVyc2VrIHdyb3RlOgo+IE9uIDA0LzA5LzE5
IDEzOjA4LCBBbnRob255IFBFUkFSRCB3cm90ZToKPiA+IGFuZCByZW1vdmUgZXh0cmEgaW5jbHVk
ZXMgb2YgT3ZtZlBsYXRmb3Jtcy5oLgo+IAo+ICgxKSBJbiBjb21taXQgbWVzc2FnZXMsIHBsZWFz
ZSBkb24ndCByZWx5IG9uIHRoZSBzdWJqZWN0IGxpbmUsIGFuZCB0aGUKPiBmaXJzdCBwYXJhZ3Jh
cGggb2YgdGhlIGJvZHksIGJlaW5nIHJlYWQgYXMgYSBzaW5nbGUgc2VudGVuY2UuCgpJIHRoaW5r
IEJhc2VUb29scy9TY3JpcHRzL1BhdGNoQ2hlY2sucHkgZG9lcyB0cnkgdG8gY2hlY2sgdGhhdCB0
aGUKc2Vjb25kIGxpbmUgb2YgdGhlIGNvbW1pdCBtZXNzYWdlIGlzIGFuIGVtcHR5IGxpbmUuCgpB
bHNvLApodHRwczovL2dpdGh1Yi5jb20vdGlhbm9jb3JlL3RpYW5vY29yZS5naXRodWIuaW8vd2lr
aS9Db21taXQtTWVzc2FnZS1Gb3JtYXQKCi1Kb3JkYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
