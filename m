From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/pv-shim: Avoid a command line parameter
 warning for CONFIG_PV_SHIM_EXCLUSIVE builds
Date: Wed, 30 Jan 2019 10:07:08 +0000
Message-ID: <fd383b41-4103-4148-55e9-be61a79342c1@citrix.com>
References: <1548788870-1851-1-git-send-email-andrew.cooper3@citrix.com>
 <5C51751B0200007800212354@prv1-mh.provo.novell.com>
 <804418e7-a5c8-b108-dceb-a9ca7c04d312@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QFm2=QG=citrix.com=prvs=926d8012e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gomm0-0006cI-0u
 for xen-devel@lists.xenproject.org; Wed, 30 Jan 2019 10:07:12 +0000
In-Reply-To: <804418e7-a5c8-b108-dceb-a9ca7c04d312@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMDEvMjAxOSAxMDowMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAzMC8wMS8yMDE5
IDA5OjU3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMjkuMDEuMTkgYXQgMjA6MDcsIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9w
di9zaGltLmMKPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9wdi9zaGltLmMKPj4+IEBAIC00MCw3ICs0
MCwxMSBAQAo+Pj4gICN1bmRlZiB2aXJ0X3RvX21mbgo+Pj4gICNkZWZpbmUgdmlydF90b19tZm4o
dmEpIF9tZm4oX192aXJ0X3RvX21mbih2YSkpCj4+PiAgCj4+PiAtI2lmbmRlZiBDT05GSUdfUFZf
U0hJTV9FWENMVVNJVkUKPj4+ICsjaWZkZWYgQ09ORklHX1BWX1NISU1fRVhDTFVTSVZFCj4+PiAr
LyogVG9sZXJhdGUgInB2LXNoaW0iIGJlaW5nIHBhc3NlZCB0byBhIENPTkZJR19QVl9TSElNX0VY
Q0xVU0lWRSBoeXBlcnZpc29yLiAqLwo+Pj4gK3N0YXRpYyBib29sIF9kaXNjYXJkOwo+Pj4gK2Jv
b2xlYW5fcGFyYW0oInB2LXNoaW0iLCBfZGlzY2FyZCk7Cj4+PiArI2Vsc2UKPj4+ICBib29sIHB2
X3NoaW07Cj4+PiAgYm9vbGVhbl9wYXJhbSgicHYtc2hpbSIsIHB2X3NoaW0pOwo+Pj4gICNlbmRp
Zgo+PiBJdCB3b3VsZCBlbmQgdXAgYmVpbmcgbGVzcyBleHRyYSBjb2RlIGlmIHlvdSBkaWQKPj4K
Pj4gI2lmZGVmIENPTkZJR19QVl9TSElNX0VYQ0xVU0lWRQo+PiAvKiBUb2xlcmF0ZSAicHYtc2hp
bSIgYmVpbmcgcGFzc2VkIHRvIGEgQ09ORklHX1BWX1NISU1fRVhDTFVTSVZFIGh5cGVydmlzb3Iu
ICovCj4+IHN0YXRpYyBib29sIF9faW5pdGRhdGEgcHZfc2hpbTsKPj4gI2Vsc2UKPj4gYm9vbCBw
dl9zaGltOwo+PiAjZW5kaWYKPj4gYm9vbGVhbl9wYXJhbSgicHYtc2hpbSIsIHB2X3NoaW0pOwo+
IFNhZGx5IG5vdC7CoCBJbiB0aGUgRVhDTFVTSVZFIGNhc2UsIHB2X3NoaW0gaXMgZGVmaW5lZCB0
byBiZSAxLCBhbmQgdGhlbgo+IHlvdSd2ZSBnb3QgYW4gb2JqZWN0IG5hbWVkIHdpdGgganVzdCBh
IG51bWJlci7CoCAoSSB0cmllZCB0aGlzIGFwcHJvYWNoCj4gZmlyc3QuKQo+Cj4gSSBjYW4ndCB0
aGluayBvZiBhbnkgY2xlYW5lciBzb2x1dGlvbi4KCkFjdHVhbGx5LCBJIGNvdWxkIG1vdmUgdGhp
cyB0byB0aGUgYm90dG9tIG9mIHRoZSBmaWxlLCBhbmQganVzdCB1bmRlZgpwdl9zaGltLgoKfkFu
ZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
