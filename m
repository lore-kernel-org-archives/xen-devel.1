From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [OSSTEST PATCH v2 07/19] ts-host-install: don't use
 the new nic naming scheme
Date: Fri, 19 Jan 2018 14:21:24 +0000
Message-ID: <20180119142124.h2ldgdssch7duy4s@citrix.com>
References: <20171031135203.11537-1-wei.liu2@citrix.com>
 <20171031135203.11537-8-wei.liu2@citrix.com>
 <bca1c4ed-c061-3510-e80d-69802a8ac806@linaro.org>
 <3c780892-4aac-1532-d09a-f5e2ce803fdf@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=l45d=ae=citrix.com=prvs=5505d9d7e=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ecXXs-0004Os-Tc
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2018 14:21:28 +0000
Content-Disposition: inline
In-Reply-To: <3c780892-4aac-1532-d09a-f5e2ce803fdf@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@linaro.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBEZWMgMTUsIDIwMTcgYXQgMDM6NDU6MDZQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IAo+IAo+IE9uIDEyLzEyLzE3IDE1OjE1LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiBI
aSBXZWkvSWFuLAo+IAo+IEhpLAo+IAo+ID4gSSBoYXZlIHRyaWVkIHRoaXMgc2VyaWVzIG9uIEFy
bTY0IGhhcmR3YXJlLiBJIGFtIGFibGUgdG8gYm9vdCBhbmQKPiA+IGluc3RhbGwgRGViaWFuIG9u
IEFNRCBTZWF0dGxlIChsYXh0b257MCwxfSkuIEJ1dCBJIGRvbid0IGdldCBuZXR3b3JrCj4gPiB3
aGVuIHVzaW5nIENhdml1bSBUaHVuZGVyLVggKHJvY2hlc3RlcnswLDF9KSBhZnRlciByZWJvb3Qu
Cj4gPiAKPiA+IExvb2tpbmcgaW50byBtb3JlIGRldGFpbHMsIHRoZSBpbnRlcmZhY2UgbmFtaW5n
IGlzIG5vdCB0aGUgc2FtZSBiZXR3ZWVuCj4gPiB0aGUgaW5zdGFsbGVyIGFuZCBhZnRlciByZWJv
b3QuIEluIHRoZSBmb3JtZXIsIGV0aDQgaXMgdXNlZCB3aGlsc3QgdGhlCj4gPiBsYXR0ZXIgdXNl
cyBldGg1IGZvciB0aGUgc2FtZSBpbnRlcmZhY2UgKFVTQiBuZXR3b3JrIGRvbmdsZSkuCj4gPiAK
PiA+IEkgaGF2ZSB0cmllZCB0byB1c2UgJ2ludGVyZmFjZSBmb3JjZScgcHJvcGVydHkgdG8gaW1w
b3NlIGV0aDQsIHdpdGhvdXQKPiA+IG11Y2ggbHVjay4gVGhlIGludGVyZmFjZSBuYW1pbmcgaXMg
c3RpbGwgZXRoNSBhZnRlciByZWJvb3QuCj4gPiAKPiA+IEkgd2FzIHdvbmRlcmluZyBpZiB5b3Ug
aGF2ZSBhbnkgaWRlYSBob3cgdG8gc29sdmUgdGhlIG5hbWluZyBzY2hlbWUgaXNzdWU/Cj4gCj4g
SSBkdWcgYSBiaXQgbW9yZSwgc28gJ2ZvcmNlIGludGVyZmFjZScgd2lsbCBjcmVhdGUgdGhlCj4g
L2V0Yy91ZGV2L3J1bGVzLmQvNzAtcGVyc2lzdGVudC1uZXQucnVsZXMgZm9yIHRoZSBpbnN0YWxs
ZXIgaW5pdHJkLgo+IAo+IEhvd2V2ZXIsIGl0IGRvZXMgbm90IGdldCBjb3BpZWQgdG8gdGhlIGlu
c3RhbGxlZCBEZWJpYW4uIEZvciB0aGUgbW9tZW50LCBJCj4gd29ya2Fyb3VuZCB0aGlzIGJ5IGNv
cHlpbmcgdGhlIGZpbGUgaW4gb3ZlcmxheS8gc28gaXQgZ2V0IGluc3RhbGxlZC4KPiAKCkkgdHJp
ZWQgdGhhdCBhcyB3ZWxsLCBidXQgdGhhdCdzIHdyb25nLgoKVGhhdCB3b3VsZCBtYWtlIHRoZSBn
ZW5lcmF0ZWQgcnVsZSBnZXQgY29waWVkIGluIHRvIHRoZSBob3N0IGluaXRyZCwKd2hpY2ggZW5k
cyB1cCBiZWluZyB1c2VkIGFzIHRoZSBndWVzdHMgaW5pdHJkIChhdCBsZWFzdCBvbiB4ODYpLCB0
aGVuCnRoZSBndWVzdCB3aWxsIGhpamFjayB0aGUgaG9zdCdzIElQIGFkZHJlc3MgKCEpLgoKPiBX
aXRoIHRoYXQsIEkgbWFuYWdlIHRvIGdldCB0aGUgbmV0d29yayBpbiB0aGUgaW5zdGFsbGVkIERl
Ymlhbi4gSSBndWVzcyB0aGlzCj4gaXMgbm90IHRoZSByaWdodCB3YXkuIFdoYXQgd291bGQgYmUg
dGhlIHJpZ2h0IHdheT8KPiAKClNlZSB2MyBvZiB0aGlzIHNlcmllcywgd2hpY2ggaGFzIGEgcGF0
Y2ggbmFtZWQ6CgpTZXQgbWFjIGFkZHJlc3MgaW4gaW50ZXJmYWNlcyg1KSBpZiBmb3JjZS1tYWMt
YWRkcmVzcyBpcyBzZXQKClRoYXQgc2hvdWxkIHdvcmsgb24gQVJNLCB0b28uIAoKV2VpLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
