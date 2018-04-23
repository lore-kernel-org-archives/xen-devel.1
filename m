From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [RFC v2 6/9] libxl: Have QEMU save its state to a
 file descriptor
Date: Mon, 23 Apr 2018 16:45:28 +0100
Message-ID: <20180423154528.GE1980@perard>
References: <20180416173227.22671-1-anthony.perard@citrix.com>
 <20180416173227.22671-7-anthony.perard@citrix.com>
 <20180423092042.7hv5inelfoc6u3bi@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=l+ue=hm=citrix.com=prvs=644fc49e2=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fAdem-00045w-VW
 for xen-devel@lists.xenproject.org; Mon, 23 Apr 2018 15:45:33 +0000
Content-Disposition: inline
In-Reply-To: <20180423092042.7hv5inelfoc6u3bi@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBcHIgMjMsIDIwMTggYXQgMTA6MjA6NDJBTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBNb24sIEFwciAxNiwgMjAxOCBhdCAwNjozMjoyNFBNICswMTAwLCBBbnRob255IFBFUkFS
RCB3cm90ZToKPiA+IEluIGNhc2UgUUVNVSBoYXZlIHJlc3RyaWN0ZWQgYWNjZXNzIHRvIHRoZSBz
eXN0ZW0sIG9wZW4gdGhlIGZpbGUgZm9yIGl0LAo+ID4gYW5kIFFFTVUgd2lsbCBzYXZlIGl0cyBz
dGF0ZSB0byB0aGlzIGZpbGUgZGVzY3JpdG9yLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnRo
b255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiAKPiBJIHRoaW5rIHRoaXMg
aXMgZ29pbmcgdG8gYnJlYWsgRnJlZUJTRD8KCklmIHRoZSBwcmV2aW91cyBwYXRjaCB3b3JrcyBv
biBGcmVlQlNEIChMZWFybmVkIHRvIHNlbmQgRkQgdGhyb3VnaCBRTVAKdG8gUUVNVSksIHRoaXMg
cGF0Y2ggc2hvdWxkbid0IGJyZWFrIGFueXRoaW5nLiBMb29raW5nIGF0IGhvdwpsaWJ4bF9fc2Vu
ZG1zZ19mZHMoKSBpcyBpbXBsZW1lbnRlZCwgYW5kIGhvdyB0aGUgcmVjZWl2ZSBzaWRlIGlzCmlt
cGxlbWVudGVkIGluIFFFTVUsIHRoZXJlIGRvZXNuJ3Qgc2VlbXMgdG8gYmUgYW55IGRpZmZlcmVu
Y2Ugb24KRnJlZUJTRCwgc28gSSBndWVzcyBpdCdzIGdvaW5nIHRvIHdvcmsgZmluZS4KCj4gQW5k
IHdoYXQgaXMgL2Rldi9mZHNldCBleGFjdGx5PyBJIGRvbid0IHNlZW0gdG8gaGF2ZSBpdCBvbiBt
eSBEZWJpYW4KPiB3b3Jrc3RhdGlvbiAod2l0aCBMaW51eCA0LjE1KS4gU28gdGhpcyBjaGFuZ2Ug
Y2FuIHBvdGVudGlhbGx5IGJlIGJyb2tlbgo+IG9uIExpbnV4IGFzIHdlbGw/CgovZGV2L2Zkc2V0
IGlzIGEgUUVNVSBpbnRlcm5hbCBBUEkuIFlvdSBjYW4gYWRkIGEgZmlsZSBkZXNjcmlwdG9yIHRv
IGEKZmQtc2V0IHZpYSBRTVAgb3IgdmlhIHRoZSBjb21tYW5kIGxpbmUuIEFuZCBsYXRlciwgeW91
IGNhbiBnaXZlIGEgcGF0aAp0byBzb21ldGhpbmcgaW4gUUVNVSAobWF5YmUgYSBibG9jayBkcml2
ZXIpIHdoaWNoIHJlZmVyIHRvIGEgZmQtc2V0CmNyZWF0ZWQgZWFybGllci4gVGhlIHBhdGggd291
bGQgYmUgIi9kZXYvZmRzZXQvJGZkc2V0X251bWJlciIuIFRoZXJlIGNhbgpiZSBzZXZlcmFsIGZk
IGluIGEgZmQtc2V0LCBxZW11IHdpbGwganVzdCBsb29rIGZvciB0aGUgZmlyc3Qgb25lIHdoaWNo
CmhhdmUgdGhlIHJpZ2h0IHBlcm1pc3Npb24sIGxpa2UgcmVhZCBvciB3cml0ZSBwZXJtaXNzaW9u
LgoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
