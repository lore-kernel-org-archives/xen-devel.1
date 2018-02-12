From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 5/7] x86/alt: Support for automatic padding
	calculations
Date: Mon, 12 Feb 2018 18:45:00 +0000
Message-ID: <38bccf7f-954d-a3c6-88b8-3ee98755f419@citrix.com>
References: <1518434587-22827-1-git-send-email-andrew.cooper3@citrix.com>
 <1518434587-22827-6-git-send-email-andrew.cooper3@citrix.com>
 <20180212143953.cb6hvhersqk6ndew@citrix.com>
 <51f8d90b-7d0a-597b-91c6-88ede7faf20b@citrix.com>
 <20180212184103.sln22c6iflrud6wi@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180212184103.sln22c6iflrud6wi@MacBook-Pro-de-Roger.local>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMDIvMTggMTg6NDEsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gTW9uLCBGZWIg
MTIsIDIwMTggYXQgMDM6MDQ6MjFQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24g
MTIvMDIvMTggMTQ6MzksIFdlaSBMaXUgd3JvdGU6Cj4+PiBPbiBNb24sIEZlYiAxMiwgMjAxOCBh
dCAxMToyMzowNUFNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4+ICAubWFjcm8gQUxU
RVJOQVRJVkUgb2xkaW5zdHIsIG5ld2luc3RyLCBmZWF0dXJlCj4+Pj4gIC5MXEBfb3JpZ19zOgo+
Pj4+ICAgICAgXG9sZGluc3RyCj4+Pj4gIC5MXEBfb3JpZ19lOgo+Pj4+ICsgICAgIC5za2lwICgt
KChyZXBsX2xlbigxKSAtIG9yaWdfbGVuKSA+IDApICogKHJlcGxfbGVuKDEpIC0gb3JpZ19sZW4p
KSwgMHg5MAo+Pj4gU2VlaW5nIHRoZSBuZWdhdGlvbiBhdCB0aGUgYmVnaW5uaW5nLCBJIHN1cHBv
c2UgdGhpcyBzaG91bGQgYWxzbyBiZSBhCj4+PiBnYXMgc3BlY2lmaWMgbWFjcm8/Cj4+IFRoZSBi
dWlsZCBmYWlsdXJlcyBhcmUgYmVjYXVzZSBjbGFuZydzIGludGVncmF0ZWQgYXNzZW1ibGVyIGNh
bid0IGNvcGUKPj4gd2l0aCBub24tYWJzb2x1dGUgcmVmZXJlbmNlcyB3aXRoIC5za2lwLCBidXQg
d2UgYWxyZWFkeSBrbm93IGFib3V0IHRoaXMKPj4gYW5kIGhhdmUgY29kZSBpZGVudGljYWwgdG8g
dGhpcyBpbiB0cmVlLsKgIChJIHRlbXBvcmFyaWx5IHJlbW92ZWQgaXQgaW4KPj4gcGF0Y2ggNCku
Cj4gTmV3ZXIgY2xhbmcgKDYpIHN1cHBvcnRzIC5za2lwIHdpdGggbGFiZWxzLCBidXQgZG9lc24n
dCBzdXBwb3J0IHRoZQo+ICgtKC4uLiBBbmQgaXQncyBoYXZpbmcgc29tZSBpc3N1ZXMgd2l0aCB0
aGUgcmVzdCBvZiB0aGUgZXhwcmVzc2lvbiwKPiB3aWxsIGhhdmUgdG8gY2hlY2sgbW9yZSBjbG9z
ZWx5IHRvbW9ycm93Lgo+Cj4gSSB3b25kZXIsIHdoYXQncyBMaW51eCBkb2luZyBpbiB0aGlzIHJl
Z2FyZD8gSXQgc2VlbXMgbGlrZSBjbGFuZy9sbHZtCj4gaXMgcXVpdGUgY29tbWl0dGVkIHRvIHN1
cHBvcnQgYnVpbGRpbmcgTGludXgsIHNvIGl0IG1pZ2h0IGJlIGdvb2QgdG8KPiBmb2xsb3cgc3Vp
dCBpbiB0aGlzIGNhc2UuCgpUaGlzIGlzIGJhc2ljYWxseSB0aGUgc2FtZSBhcyB3aGF0IExpbnV4
IGRvZXMuwqAgTGludXggdW5jb25kaXRpb25hbGx5CnVzZXMgLW5vLWludGVncmF0ZWQtYXMuCgp+
QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
