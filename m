From: Dongli Zhang <dongli.zhang@oracle.com>
Subject: Re: [PATCH v6 2/2] xen/blkback: rework connect_ring()
 to avoid inconsistent xenstore 'ring-page-order' set by malicious blkfront
Date: Mon, 18 Feb 2019 16:04:14 +0800
Message-ID: <49564120-813d-2b80-94be-bde8123809a9__27646.4645796054$1550476940$gmane$org@oracle.com>
References: <1547484104-20625-1-git-send-email-dongli.zhang@oracle.com>
 <1547484104-20625-2-git-send-email-dongli.zhang@oracle.com>
 <20190115082036.y7svi3xz3dkqd4w4@mac>
 <20190117152919.GA26079@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6WPg=QZ=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1gvdrd-0007sL-Jt
 for xen-devel@lists.xenproject.org; Mon, 18 Feb 2019 08:01:21 +0000
In-Reply-To: <20190117152919.GA26079@localhost.localdomain>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Konrad Rzeszutek Wilk <konrad@darnok.org>, konrad.wilk@oracle.com
Cc: axboe@kernel.dk, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, Paul.Durrant@citrix.com, xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgS29ucmFkLAoKT24gMS8xNy8xOSAxMToyOSBQTSwgS29ucmFkIFJ6ZXN6dXRlayBXaWxrIHdy
b3RlOgo+IE9uIFR1ZSwgSmFuIDE1LCAyMDE5IGF0IDA5OjIwOjM2QU0gKzAxMDAsIFJvZ2VyIFBh
dSBNb25uw6kgd3JvdGU6Cj4+IE9uIFR1ZSwgSmFuIDE1LCAyMDE5IGF0IDEyOjQxOjQ0QU0gKzA4
MDAsIERvbmdsaSBaaGFuZyB3cm90ZToKPj4+IFRoZSB4ZW5zdG9yZSAncmluZy1wYWdlLW9yZGVy
JyBpcyB1c2VkIGdsb2JhbGx5IGZvciBlYWNoIGJsa2JhY2sgcXVldWUgYW5kCj4+PiB0aGVyZWZv
cmUgc2hvdWxkIGJlIHJlYWQgZnJvbSB4ZW5zdG9yZSBvbmx5IG9uY2UuIEhvd2V2ZXIsIGl0IGlz
IG9idGFpbmVkCj4+PiBpbiByZWFkX3Blcl9yaW5nX3JlZnMoKSB3aGljaCBtaWdodCBiZSBjYWxs
ZWQgbXVsdGlwbGUgdGltZXMgZHVyaW5nIHRoZQo+Pj4gaW5pdGlhbGl6YXRpb24gb2YgZWFjaCBi
bGtiYWNrIHF1ZXVlLgo+Pj4KPj4+IElmIHRoZSBibGtmcm9udCBpcyBtYWxpY2lvdXMgYW5kIHRo
ZSAncmluZy1wYWdlLW9yZGVyJyBpcyBzZXQgaW4gZGlmZmVyZW50Cj4+PiB2YWx1ZSBieSBibGtm
cm9udCBldmVyeSB0aW1lIGJlZm9yZSBibGtiYWNrIHJlYWRzIGl0LCB0aGlzIG1heSBlbmQgdXAg
YXQKPj4+IHRoZSAiV0FSTl9PTihpICE9IChYRU5fQkxLSUZfUkVRU19QRVJfUEFHRSAqIGJsa2lm
LT5ucl9yaW5nX3BhZ2VzKSk7IiBpbgo+Pj4geGVuX2Jsa2lmX2Rpc2Nvbm5lY3QoKSB3aGVuIGZy
b250ZW5kIGlzIGRlc3Ryb3llZC4KPj4+Cj4+PiBUaGlzIHBhdGNoIHJld29ya3MgY29ubmVjdF9y
aW5nKCkgdG8gcmVhZCB4ZW5zdG9yZSAncmluZy1wYWdlLW9yZGVyJyBvbmx5Cj4+PiBvbmNlLgo+
Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IERvbmdsaSBaaGFuZyA8ZG9uZ2xpLnpoYW5nQG9yYWNsZS5j
b20+Cj4+Cj4+IExHVE06Cj4+Cj4+IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KPiAKPiBBcHBsaWVkLgo+IAo+IFdpbGwgcHVzaCBvdXQgdG8gSmVu
cyBpbiBhIGNvdXBsZSBvZiBkYXlzLiBUaGFuayB5b3UhCj4+Cj4+IFRoYW5rcyEKCkkgb25seSBz
ZWUgdGhlIFBBVENIIDEvMiAoeGVuL2Jsa2JhY2s6IGFkZCBzdGFjayB2YXJpYWJsZSAnYmxraWYn
IGluCmNvbm5lY3RfcmluZygpKSBvbiB0aGUgdG9wIG9mIGJlbG93IGJyYW5jaCBmb3IgSmVucywg
d291bGQgeW91IHBsZWFzZSBhcHBseSB0aGlzCm9uZSAoUEFUQ0ggMi8yKSBhcyB3ZWxsPwoKaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQva29ucmFkL3hlbi5n
aXQvbG9nLz9oPWxpbnV4LW5leHQKCjEvMiBpcyBvbmx5IGEgcHJlcmVxdWlzaXRlIGZvciAyLzIu
CgpUaGFuayB5b3UgdmVyeSBtdWNoIQoKRG9uZ2xpIFpoYW5nCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
