From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH] x86/hvm: more sure APIC assist is aborted
 if guest EOIs APIC
Date: Thu, 18 Jan 2018 10:37:08 +0000
Message-ID: <9722a0ac6cdf48a287a9b493bf25ffeb@AMSPEX02CL03.citrite.net>
References: <20180117125353.3301-1-paul.durrant@citrix.com>
 <5A6069C9020000780019FB8D@prv-mh.provo.novell.com>
 <11888691a7414ff28915cec5ac8032a1@AMSPEX02CL03.citrite.net>
 <5A60793A020000780019FC41@prv-mh.provo.novell.com>
 <e6463fcadeff435eb0d885d9ce5c8a76@AMSPEX02CL03.citrite.net>
 <5A60823B020000780019FCB3@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=lfae=en=citrix.com=prvs=549c6d655=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1ec7ZN-0002lw-5r
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2018 10:37:17 +0000
In-Reply-To: <5A60823B020000780019FCB3@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMTggSmFudWFyeSAyMDE4IDEwOjE3Cj4gVG86IFBh
dWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IEFuZHJldyBDb29wZXIg
PEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyB4ZW4tCj4gZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKPiBTdWJqZWN0OiBSRTogW1BBVENIXSB4ODYvaHZtOiBtb3JlIHN1cmUgQVBJQyBhc3Np
c3QgaXMgYWJvcnRlZCBpZiBndWVzdCBFT0lzCj4gQVBJQwo+IAo+ID4+PiBPbiAxOC4wMS4xOCBh
dCAxMDo1NSwgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPiB3cm90ZToKPiA+IE9rLiBJJ2xsIHJl
LXdvcmsgaXQgc28gdGhhdCBhYm9ydCBpcyBwYXNzZWQgYSB2ZWN0b3IgYW5kIHdhcm5zIG9uIG1p
c21hdGNoLgo+IAo+IFlvdSBtZWFuIG9uIHRoZSBuZXcgcGF0aCBvbmx5LCBJIHN1cHBvc2U/IFRo
ZSBvbGQgcGF0aCBzaG91bGQKPiBub3QgdHJpZ2dlciB3YXJuaW5ncyAoYWl1aSBpdCB3b3VsZCBh
bHdheXMgZG8gc28pLgoKSSB0aGluaywgaW4gdGhlIGV4aXN0aW5nIGFib3J0IGNhc2UsIHRoZSBs
YXRjaGVkIHZlY3RvciBzaG91bGQgYWx3YXlzIGJlIHRoZSBsb3dlc3QgcGVuZGluZyBiaXQgaW4g
dGhlIElTUi4KCiAgUGF1bAoKPiAKPiBKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
