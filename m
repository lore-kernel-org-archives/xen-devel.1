From: Pu Wen <puwen@hygon.cn>
Subject: Re: [PATCH v2 01/14] x86/cpu: Create Hygon Dhyana
 architecture support file
Date: Tue, 19 Mar 2019 20:33:31 +0800
Message-ID: <a50e99fa-af43-1c2b-3c31-59d8ede22d3b@hygon.cn>
References: <cover.1550647742.git.puwen@hygon.cn>
 <026111a83e9d83902bc2acee243858a21ecec304.1550647742.git.puwen@hygon.cn>
 <5C8A8B20020000780021ED49@prv1-mh.provo.novell.com>
 <586d7224-ed81-b623-35c8-4280bcbcfc5f@hygon.cn>
 <5C8B89E7020000780021F38A@prv1-mh.provo.novell.com>
 <f723e493-e986-432e-0b4a-e175f0df41c7@hygon.cn>
 <5C8F5CD4020000780021FB77@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2oAA=RW=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1h6E14-0004z1-Iv
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2019 12:38:50 +0000
In-Reply-To: <5C8F5CD4020000780021FB77@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOS8zLzE4IDE2OjU1LCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAxNi4wMy4xOSBhdCAx
MDo1NywgPHB1d2VuQGh5Z29uLmNuPiB3cm90ZToKPj4gT24gMjAxOS8zLzE1IDE5OjE4LCBKYW4g
QmV1bGljaCB3cm90ZToKPj4+IE9uIDE1LjAzLjE5IGF0IDExOjE3LCA8cHV3ZW5AaHlnb24uY24+
IHdyb3RlOgo+Pj4+IE9uIDIwMTkvMy8xNSAxOjExLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4g
VGhpcyBpcyBhIGxvdCBvZiBkdXBsaWNhdGVkIGNvZGUgd2l0aCBvbmx5IG1pbm9yIGRpZmZlcmVu
Y2VzLiBJIHRoaW5rCj4+Pj4+IHlvdSB3b3VsZCBiZSBiZXR0ZXIgb2ZmIGNhbGxpbmcgaW50byB0
aGUgQU1EIG9yaWdpbmFsIGZ1bmN0aW9ucy4KPj4+PiBUaGVzZSBmdW5jdGlvbnMgYW5kIEFNRCBv
cmlnaW5hbCBvbmVzIGFyZSBzdGF0aWMuIFNvIEh5Z29uIGNhbm5vdCBkaXJlY3RseQo+Pj4+IGNh
bGwgaW50byB0aGVtLiBPciB3ZSBjYW4gcHV0IHRoZW0gaW50byB0aGUgY29tbW9uIGNwdSBjb2Rl
LCBidXQgSSB0aGluawo+Pj4+IGl0J3Mgbm90IGdvb2QgZm9yIGZ1dHVyZSBtYWludGVuYW5jZS4K
Pj4+IEp1c3QgbWFrZSBub24tc3RhdGljIHdoYXQgbmVlZHMgdG8gYmUsIGFkZCBhbiBhbWRfIHBy
ZWZpeCwgYW5kCj4+PiBjYWxsIGl0IGZyb20geW91ciBjb2RlLgo+PiBUaGF0J3MgT0suIFdpdGgg
dGhpcyBtZXRob2Qgb25seSBpbml0X2xldmVsbGluZyBpbiBhbWQuYyBzaG91bGQgYmUgYWRkZWQK
Pj4gYW4gYW1kXyBwcmVmaXggYW5kIGNhbGxlZCBieSBoeWdvbi5jLgo+PiBCdXQgSSdtIGFmcmFp
ZCBIeWdvbiBzaG91bGQgaGF2ZSBpdHMgb3duIGluaXQgZnVuY3Rpb25zIGFuZCBub3QgY2FsbCB0
aGUKPj4gQU1EIG9uZXMuIFRoZSBjdXJyZW50IEh5Z29uIGluaXQgZnVuY3Rpb25zIGhhdmUgYmVl
biBoZWF2aWx5IHN0cmlwcGVkCj4+IGZyb20gdGhlIG9yaWdpbmFsIEFNRCdzLgo+IExldCBtZSBn
aXZlIHlvdSB0aGlzIHJ1bGUgb2YgdGh1bWIgKHN1YmplY3QgdG8gZGlzY3Vzc2lvbik6IElmIHlv
dSBjYW4KPiBzYWZlbHkgcmUtdXNlIGFueSBub24tdHJpdmlhbCBjdXJyZW50IEFNRCBmdW5jdGlv
biB3aXRoIGF0IG1vc3QgbWlub3IKPiBhZGp1c3RtZW50cyAoYW5kIGlycmVzcGVjdGl2ZSBvZiBj
ZXJ0YWluIGNvZGUgdGhlcmUgYmVpbmcgdW5yZWFjaGFibGUKPiBvbiBIeWdvbiksIHRoZW4gSSB0
aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gcmUtdXNlIGl0IHRoYW4gdG8gZHVwbGljYXRlCj4g
aXQuCgpJIHRyaWVkLCBidXQgaXQgd2lsbCBhZGQgMHgxOCB0byBpbml0X2FtZCgpLiBJdCdzIHN0
cmFuZ2UgYmVjYXVzZSBBTUQKZG9lcyBub3QgaGF2ZSBmYW1pbHkgMThoIG5vdy4gU28gaXQgYmVj
b21lcyB1bndpZWxkeSB0byBtYWludGFpbgppbml0X2FtZCgpIGp1c3QgYXQgdGhpcyB0aW1lLiBU
aGUgc2FtZSBzaXR1YXRpb24gZm9yIGFtZF9nZXRfdG9wb2xvZ3koKS4KClNvIEkgdGhpbmsgaXQn
cyBiZXR0ZXIgdG8gY2FydmUgb3V0IGluaXRfaHlnb24oKSBhbmQgaHlnb25fZ2V0X3RvcG9sb2d5
KCkKKHdoaWNoIGFsc28gbmVlZCBIeWdvbidzIG93biBhZGp1c3RtZW50IGZvciBjb21wdXRpbmcg
cGh5c19wcm9jX2lkKS4KCkkgdGhpbmsgaXQncyB0aW1lIHRvIGRldmVsb3AgYSBuZXcgcGF0Y2gg
c2VyaWVzIGZvciB5b3VyIHJldmlldy4KCi0tIApSZWdhcmRzLApQdSBXZW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
