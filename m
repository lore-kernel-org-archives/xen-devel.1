From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3] hvm/altp2m: Clarify the proper way to
 extend the altp2m interface
Date: Tue, 31 Jul 2018 16:12:05 +0100
Message-ID: <20180731151205.be6shzpsmtdaee54@citrix.com>
References: <20180731150331.13760-1-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mxhy=kp=citrix.com=prvs=7433d6730=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fkWK7-0006ba-Ko
 for xen-devel@lists.xenproject.org; Tue, 31 Jul 2018 15:12:31 +0000
Content-Disposition: inline
In-Reply-To: <20180731150331.13760-1-george.dunlap@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Tamas K Lengyel <tamas.lengyel@zentific.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Adrian Pop <apop@bitdefender.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdWwgMzEsIDIwMTggYXQgMDQ6MDM6MzFQTSArMDEwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL2h2bS9wYXJhbXMuaCBiL3hl
bi9pbmNsdWRlL3B1YmxpYy9odm0vcGFyYW1zLmgKPiBpbmRleCAyZWMyZTdjODBmLi5kYWEyOGE4
NmJlIDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9odm0vcGFyYW1zLmgKPiArKysg
Yi94ZW4vaW5jbHVkZS9wdWJsaWMvaHZtL3BhcmFtcy5oCj4gQEAgLTIzOSw2ICsyMzksMTEgQEAK
PiAgICogIG1peGVkOiBhbGxvdyBhY2Nlc3MgdG8gYWxsIGFsdHAybSBvcHMgZm9yIGJvdGggaW4t
Z3Vlc3QgYW5kIGV4dGVybmFsIHRvb2xzCj4gICAqICBleHRlcm5hbDogYWxsb3cgYWNjZXNzIHRv
IGV4dGVybmFsIHByaXZpbGVnZWQgdG9vbHMgb25seQo+ICAgKiAgbGltaXRlZDogZ3Vlc3Qgb25s
eSBoYXMgbGltaXRlZCBhY2Nlc3MgKGllLiBjb250cm9sIFZNRlVOQyBhbmQgI1ZFKQo+ICsgKgo+
ICsgKiBOb3RlIHRoYXQgJ21peGVkJyBtb2RlIGhhcyBub3QgYmVlbiBldmFsdWF0ZWQgZm9yIHNh
ZmV0eSBmcm9tIGEKPiArICogc2VjdXJpdHkgcGVyc3BlY3RpdmUuICBCZWZvcmUgdXNpbmcgdGhp
cyBtb2RlIGluIGEKPiArICogc2VjdXJpdHktY3JpdGljYWwgZW52aXJvbm1lbnQsIGVhY2ggc3Vi
b3Agc2hvdWxkIGJlIGV2YWx1YXRlZCBmb3IKPiArICogc2FmZXR5LCB3aXRoIHVuc2FmZSBzdWJv
cHMgYmxhY2tsaXN0ZWQgaW4geHNtX2h2bV9hbHRwMm1odm1fb3AoKS4KCk9oLCBvbmUgbWlub3Ig
bml0OiBJIHRoaW5rIEkgd2lsbCByZXBsYWNlIHhzbV9odm1fYWx0cDJtaHZtX29wIHdpdGgganVz
dAoiWFNNIiBpZiBwb3NzaWJsZSAtLSB0aGVyZSBpcyBubyBuZWVkIHRvIG1lbnRpb24gYW4gaW50
ZXJuYWwgZnVuY3Rpb24gaW4KcHVibGljIGhlYWRlci4KCldlaS4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
