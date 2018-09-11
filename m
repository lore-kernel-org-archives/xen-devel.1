From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 07/13] optee: add std call handling
Date: Tue, 11 Sep 2018 14:30:52 +0100
Message-ID: <d1743e09-8983-5d0d-46b0-c41c951c42cc@arm.com>
References: <1535993677-20816-1-git-send-email-volodymyr_babchuk@epam.com>
 <1535993677-20816-8-git-send-email-volodymyr_babchuk@epam.com>
 <71623728-5776-16b3-1adc-39a3f2ff8939@arm.com>
 <89bc6a1d-b2ab-703b-f193-169d3f7e4caf@epam.com>
 <21b092ba-a698-895b-b688-f2b6b2dc1575@arm.com>
 <e6cdfa0b-b785-41a4-d69d-33d79fd079ed@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xkfk=lz=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fzikq-0007wg-I8
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 13:30:56 +0000
In-Reply-To: <e6cdfa0b-b785-41a4-d69d-33d79fd079ed@epam.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Volodymyr Babchuk <volodymyr_babchuk@epam.com>, xen-devel@lists.xenproject.org, xen-devel@lists.xen.org
Cc: tee-dev@lists.linaro.org, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMS8wOS8xOCAxMjozMSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4gCj4gCj4gT24g
MTEuMDkuMTggMTQ6MTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4KPj4KPj4gT24gMTAvMDkvMTgg
MTg6MzcsIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+Pj4gSGkgSnVsaWVuLAo+Pgo+PiBIaSwK
Pj4KPj4+IE9uIDA1LjA5LjE4IDE4OjE3LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4gSGksCj4+
Pj4KPj4+PiBPbiAwOS8wMy8yMDE4IDA1OjU0IFBNLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToK
Pj4+Pj4gTWFpbiB3YXkgdG8gY29tbXVuaWNhdGUgd2l0aCBPUC1URUUgaXMgdG8gaXNzdWUgc3Rh
bmRhcmQgU01DQ0MKPj4+Pgo+Pj4+IE5JVDogVGhlIG1haW4gd2F5Cj4+Pj4KPj4+Pj4gY2FsbC4g
IlN0YW5kYXJkIiBpcyBhIFNNQ0NDIHRlcm0gYW5kIGl0IG1lYW5zIHRoYXQgY2FsbCBjYW4gYmUK
Pj4+Pj4gaW50ZXJydXB0ZWQgYW5kIE9QLVRFRSBjYW4gcmV0dXJuIGNvbnRyb2wgdG8gTlcgYmVm
b3JlIGNvbXBsZXRpbmcKPj4+Pj4gdGhlIGNhbGwuCj4+Pj4+Cj4+Pj4+IEluIGNvbnRyYW5zdCB3
aXRoIGZhc3QgY2FsbHMsIHdoZXJlIGFyZ3VtZW50cyBhbmQgcmV0dXJuIHZhbHVlcwo+Pj4+Cj4+
Pj4gTklUOiBzL2NvbnRyYW5zdC9jb250cmFzdC8KPj4+Pgo+Pj4+PiBhcmUgcGFzc2VkIGluIHJl
Z2lzdGVycywgc3RhbmRhcmQgY2FsbHMgdXNlIHNoYXJlZCBtZW1vcnkuIFJlZ2lzdGVyCj4+Pj4+
IHBhaXIgcjEscjIgaG9sZHMgNjQtYml0IFBBIG9mIGNvbW1hbmQgYnVmZmVyLCB3aGVyZSBhbGwg
YXJndW1lbnRzCj4+Pj4KPj4+PiBEbyB5b3UgbWVhbiB3MSwgdzI/Cj4+PiBHb29kIHF1ZXN0aW9u
LiBIb3cgdG8gY2FsbCB0aGUgcmVnaXN0ZXJzLCBzbyBpdCB3b3VsZCBiZSB2YWxpZCBib3RoCj4+
PiBmb3IgQVJNdjcgYW5kIEFSTXY4Pwo+Pgo+PiBXaGljaCBuYW1pbmcgZG9lcyBPUC1URUUgdXNl
PyBJcyBpdCBhKj8KPj4KPiBFeGFjdGx5LiBJJ3ZlIHNlZW4gdGhlIHNhbWUgY29udmVudGlvbiBp
biBYRU4sIGluIHNtY2NjIGNvZGUuIFNvLCBhKiwgdGhlbj8KCkl0IHdvdWxkIGJlIG5pY2UgdG8g
c3RheSBjb25zaXN0ZW50IHdpdGggT1AtVEVFLiBTbyBJIHRoaW5rIGEqIHN1aXRzIGJldHRlci4K
CkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
