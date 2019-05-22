From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/3] xen: drop in_atomic()
Date: Wed, 22 May 2019 15:01:03 +0200
Message-ID: <c3d83d55-b987-bc9b-5af2-00474f696a02@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aAGA=TW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hTQrj-0006XF-Pc
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 13:01:07 +0000
References: =?UTF-8?B?PDIwMTkwNTIyMDk0NTQ5LjI4Mzk377+9Me+/vWpncm9zc0BzdXNl?=
 =?UTF-8?B?LmNvbT4gPDIwMTkwNTIyMDk0NTQ5LjI4Mzk377+9Mu+/vWpncm9zc0BzdXNlLmNv?=
 =?UTF-8?Q?m=3e_=3c5CE52014020000780023147E=40suse=2ecom=3e_=3cf100e5be-cf19?=
 =?UTF-8?Q?-bf28-c113-b07b4fe99c59=40suse=2ecom=3e_=3c5CE541D602000078002315?=
 =?UTF-8?B?ODdAc3VzZS5jb20+?=
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDUvMjAxOSAxNDozNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjIuMDUuMTkg
YXQgMTI6MTksIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBPbiAyMi8wNS8yMDE5IDEyOjEw
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDIyLjA1LjE5IGF0IDExOjQ1LCA8amdyb3Nz
QHN1c2UuY29tPiB3cm90ZToKPj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCj4+Pj4g
KysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+Pj4+IEBAIC0zMTg1LDIyICszMTg1LDYgQEAg
c3RhdGljIGVudW0gaHZtX3RyYW5zbGF0aW9uX3Jlc3VsdCBfX2h2bV9jb3B5KAo+Pj4+ICAKPj4+
PiAgICAgIEFTU0VSVChpc19odm1fdmNwdSh2KSk7Cj4+Pj4gIAo+Pj4+IC0gICAgLyoKPj4+PiAt
ICAgICAqIFhYWCBEaXNhYmxlIGZvciA0LjEuMDogUFYtb24tSFZNIGRyaXZlcnMgd2lsbCBkbyBn
cmFudC10YWJsZSBvcHMKPj4+PiAtICAgICAqIHN1Y2ggYXMgcXVlcnlfc2l6ZS4gR3JhbnQtdGFi
bGUgY29kZSBjdXJyZW50bHkgZG9lcyAKPj4gY29weV90by9mcm9tX2d1ZXN0Cj4+Pj4gLSAgICAg
KiBhY2Nlc3NlcyB1bmRlciB0aGUgYmlnIHBlci1kb21haW4gbG9jaywgd2hpY2ggdGhpcyB0ZXN0
IHdvdWxkIAo+PiBkaXNhbGxvdy4KPj4+PiAtICAgICAqIFRoZSB0ZXN0IGlzIG5vdCBuZWVkZWQg
dW50aWwgd2UgaW1wbGVtZW50IHNsZWVwaW5nLW9uLXdhaXRxdWV1ZSB3aGVuCj4+Pj4gLSAgICAg
KiB3ZSBhY2Nlc3MgYSBwYWdlZC1vdXQgZnJhbWUsIGFuZCB0aGF0J3MgcG9zdCA0LjEuMCBub3cu
Cj4+Pj4gLSAgICAgKi8KPj4+PiAtI2lmIDAKPj4+PiAtICAgIC8qCj4+Pj4gLSAgICAgKiBJZiB0
aGUgcmVxdWlyZWQgZ3Vlc3QgbWVtb3J5IGlzIHBhZ2VkIG91dCwgdGhpcyBmdW5jdGlvbiBtYXkg
c2xlZXAuCj4+Pj4gLSAgICAgKiBIZW5jZSB3ZSBiYWlsIGltbWVkaWF0ZWx5IGlmIGNhbGxlZCBm
cm9tIGF0b21pYyBjb250ZXh0Lgo+Pj4+IC0gICAgICovCj4+Pj4gLSAgICBpZiAoIGluX2F0b21p
YygpICkKPj4+PiAtICAgICAgICByZXR1cm4gSFZNVFJBTlNfdW5oYW5kbGVhYmxlOwo+Pj4+IC0j
ZW5kaWYKPj4+Cj4+PiBEZWFsaW5nIHdpdGggdGhpcyBUT0RPIGl0ZW0gaXMgb2YgY291cnNlIG11
Y2ggYXBwcmVjaWF0ZWQsIGJ1dAo+Pj4gc2hvdWxkIGl0IHJlYWxseSBiZSBkZWxldGVkIGFsdG9n
ZXRoZXI/IFRoZSBiaWctZG9tYWluLWxvY2sgaXNzdWUKPj4+IGlzIGdvbmUgYWZhaXIsIGluIHdo
aWNoIGNhc2UgZHJvcHBpbmcgdGhlICNpZiAwIHdvdWxkIHNlZW0KPj4+IHBvc3NpYmxlIHRvIG1l
LCBldmVuIGlmIGl0J3Mgbm90IHN0cmljdGx5IG5lZWRlZCB3aXRob3V0IHRoZSBzbGVlcC0KPj4+
IG9uLXdhaXRxdWV1ZSBiZWhhdmlvciBtZW50aW9uZWQuCj4+Cj4+IFF1ZXN0aW9uIGlzIHdoZXRo
ZXIgaXQgaXMgd29ydGggdG8ga2VlcCBpdCByZXN1bHRpbmcgaW4gdGhlIG5lZWQgdG8KPj4ga2Vl
cCBwcmVlbXB0X2NvdW50KCkgYXMgd2VsbC4KPiAKPiBXZWxsLCBwZXJzb25hbGx5IEkgdGhpbmsg
a2VlcGluZyBpdCBpcyBhIHNtYWxsIHByaWNlIHRvIHBheS4gQnV0IHNlZWluZwo+IEFuZHJldydz
IFItYiBoZSBjbGVhcmx5IHRoaW5rcyBkaWZmZXJlbnQuIEFuZCBqdXN0IHRvIGJlIGNsZWFyIC0g
SQo+IGRvbid0IHJlYWxseSB3YW50IHRvIHZldG8gdGhpcyBjaGFuZ2UsIGFzIGF0IHRoZSBzYW1l
IHRpbWUgaXQncyBhbHNvCj4gZWFzeSBlbm91Z2ggdG8gcHV0IGJhY2sgaWYgbmVlZCBiZS4gQnV0
IEknZCBsaWtlIHRoaXMgdG8gYmUgZ2l2ZSBhCj4gMm5kIGNvbnNpZGVyYXRpb24gYXQgbGVhc3Qu
CgpDb21wbGV0ZWx5IHVuZGVyc3RhbmRhYmxlLgoKSSBqdXN0IHN0dW1ibGVkIG92ZXIgdGhhdCB3
aGVuIEkgbmVlZGVkIHRvIGludHJvZHVjZSByY3VfcmVhZF9sb2NrKCkKdXNhZ2UgaW4gc29tZSBo
b3QgcGF0aHMgZm9yIG15IGNvcmUgc2NoZWR1bGluZyBzZXJpZXMgYW5kIEkgd2FudGVkIHRvCnVu
ZGVyc3RhbmQgdGhlIHBlcmZvcm1hbmNlIGltcGxpY2F0aW9ucyBmb3IgYWRkaW5nIHRob3NlIGNh
bGxzLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
