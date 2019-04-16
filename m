From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/arm: p2m: configure pa_range_info table
 to support 42 bit PA systems.
Date: Tue, 16 Apr 2019 15:42:12 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1904161541570.1370@sstabellini-ThinkPad-X260>
References: <20190315083439.23068-1-vishnu@os.amperecomputing.com>
 <68101da7-87b2-5514-26f6-a4e4d5f18be2@arm.com>
 <21628b60-483a-69e5-cc5e-7c5ec98f93a7@os.amperecomputing.com>
 <3c0153aa-0662-c51f-039c-2beb7eaaa34d@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VklA=SS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hGWmM-0002FB-GJ
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 22:42:14 +0000
In-Reply-To: <3c0153aa-0662-c51f-039c-2beb7eaaa34d@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Feng Kan OS <fengkan@os.amperecomputing.com>, Vishnu Pajjuri OS <vishnu@os.amperecomputing.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCA4IEFwciAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCj4gCj4gT24gMy8x
NS8xOSAxMTo1NyBQTSwgRmVuZyBLYW4gT1Mgd3JvdGU6Cj4gPiBUaGFua3MgSnVsaWVuLgo+ID4g
Cj4gPiBPbiAzLzE1LzE5IDQ6MjEgQU0sIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+ID4gSGksCj4g
PiA+IAo+ID4gPiBUaGFuayB5b3UgZm9yIHBvc3RpbmcgdGhlIHBhdGNoLgo+ID4gPiAKPiA+ID4g
VGl0bGU6IE5vIG5lZWQgZm9yIGZ1bGwgc3RvcCBpbiB0aGUgY29tbWl0IHRpdGxlLgo+ID4gPiAK
PiA+ID4gT24gMTUvMDMvMjAxOSAwODozNCwgVmlzaG51IFBhamp1cmkgT1Mgd3JvdGU6Cj4gPiA+
IEkgY2FuJ3QgcmVtZW1iZXIgd2hpY2ggb3RoZXIgcGxhdGZvcm1zIHN1cHBvcnQgNDItYml0cyBQ
QS4gSSB0aGluayBhdAo+ID4gPiB0aGF0IHRpbWUgaXQgd2FzIFgtR2VuZS4gQXMgbG9uZyBhcyBu
byBjdXJyZW50IGVtYmVkZGVkIHBsYXRmb3JtIHdlCj4gPiA+IHN1cHBvcnQgdXNlIDQyLWJpdCBQ
QSwgdGhpcyBjaGFuZ2UgbWF5IGJlIG9rLiBTdGVmYW5vIGRvIHlvdSByZWNhbGwgd2hhdAo+ID4g
PiB3YXMgdGhlIHBsYXRmb3JtPwo+ID4gQW1wZXJlIGVNQUcgcGxhdGZvcm0gaXMgZXNzZW50aWFs
bHkgdGhlIGNvbnRpbnVhdGlvbiBvZiBYLUdlbmUuIFRoZXNlCj4gPiBzeXN0ZW1zIGFyZSB0YXJn
ZXRlZCBhcyBzZXJ2ZXJzIHdpdGggdXB0byAxVEIgb2YgUkFNLgo+ID4gPiAKPiA+ID4gSW4gYW55
IGNhc2UsIHRoZSBuZXcgYmVoYXZpb3IgKGFuZCBjb25zZXF1ZW5jZSkgbmVlZHMgdG8gYmUgY2xl
YXJseQo+ID4gPiBleHBsYWluZWQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgo+ID4gR290IGl0LCB3
ZSB3aWxsIHJlc3VibWl0IGlmIFN0ZWZhbm8gaXMgb2theSB3aXRoIHRoZSBjaGFuZ2UuCj4gCj4g
VG8gbWFrZSBwcm9ncmVzcyBvbiB0aGlzIHBhdGNoLCBJIHdvdWxkIHN1Z2dlc3QgdG8gcmVzdWJt
aXQgaXQgd2l0aCB0aGUKPiBjaGFuZ2VzIHJlcXVlc3RlZC4KClllcywgcGxlYXNlIHNlbmQgdGhl
IG5ldyBwYXRjaC4gU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5LgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
