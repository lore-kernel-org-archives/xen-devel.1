From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v7] arch/x86: Add registers to vm_event
Date: Fri, 2 Nov 2018 14:00:11 +0000
Message-ID: <c4997ab4-e95f-8f9a-438e-52fc08d6b18a@citrix.com>
References: <20181102125419.26641-1-aisaila@bitdefender.com>
 <5BDC4A7802000078001F7374@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=a587=nn=citrix.com=prvs=837a34217=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gIZzk-0002OM-97
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 14:00:16 +0000
In-Reply-To: <5BDC4A7802000078001F7374@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, aisaila@bitdefender.com
Cc: xen-devel <xen-devel@lists.xenproject.org>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMTEvMTggMTM6MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDAyLjExLjE4IGF0
IDEzOjU0LCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+PiBAQCAtMTkxLDkgKzE5
NywyNiBAQCBzdHJ1Y3Qgdm1fZXZlbnRfcmVnc194ODYgewo+PiAgICAgIHVpbnQ2NF90IG1zcl9l
ZmVyOwo+PiAgICAgIHVpbnQ2NF90IG1zcl9zdGFyOwo+PiAgICAgIHVpbnQ2NF90IG1zcl9sc3Rh
cjsKPj4gKyAgICB1aW50MzJfdCBjc19iYXNlOwo+PiArICAgIHVpbnQzMl90IHNzX2Jhc2U7Cj4+
ICsgICAgdWludDMyX3QgZHNfYmFzZTsKPj4gKyAgICB1aW50MzJfdCBlc19iYXNlOwo+PiAgICAg
IHVpbnQ2NF90IGZzX2Jhc2U7Cj4+ICAgICAgdWludDY0X3QgZ3NfYmFzZTsKPj4gLSAgICB1aW50
MzJfdCBjc19hcmJ5dGVzOwo+PiArICAgIHN0cnVjdCB2bV9ldmVudF94ODZfc2VsZWN0b3JfcmVn
IGNzOwo+PiArICAgIHN0cnVjdCB2bV9ldmVudF94ODZfc2VsZWN0b3JfcmVnIHNzOwo+PiArICAg
IHN0cnVjdCB2bV9ldmVudF94ODZfc2VsZWN0b3JfcmVnIGRzOwo+PiArICAgIHN0cnVjdCB2bV9l
dmVudF94ODZfc2VsZWN0b3JfcmVnIGVzOwo+PiArICAgIHN0cnVjdCB2bV9ldmVudF94ODZfc2Vs
ZWN0b3JfcmVnIGZzOwo+PiArICAgIHN0cnVjdCB2bV9ldmVudF94ODZfc2VsZWN0b3JfcmVnIGdz
Owo+PiArICAgIHVpbnQ2NF90IHNoYWRvd19nczsKPj4gKyAgICB1aW50NjRfdCBkcjY7Cj4+ICsg
ICAgdWludDE2X3QgY3Nfc2VsOwo+PiArICAgIHVpbnQxNl90IHNzX3NlbDsKPj4gKyAgICB1aW50
MTZfdCBkc19zZWw7Cj4+ICsgICAgdWludDE2X3QgZXNfc2VsOwo+PiArICAgIHVpbnQxNl90IGZz
X3NlbDsKPj4gKyAgICB1aW50MTZfdCBnc19zZWw7Cj4+ICAgICAgdWludDMyX3QgX3BhZDsKPj4g
IH07Cj4gRG8gd2UgcmVhbGx5IG5lZWQgZHI2IGJlIDY0IGJpdHMgd2lkZT8KCkdpdmVuIHRoYXQg
dGhlIG90aGVyICVjciBhbmQgJWRyIHJlZ2lzdGVycyBhcmUgNjRiaXQsIEknZCBhcmd1ZSBpbgpm
YXZvdXIgb2YgY29uc2lzdGVuY3kuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
