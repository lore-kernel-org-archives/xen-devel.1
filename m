From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 4/5] x86/alternative: Implement NMI/#MC-safe
 patching
Date: Wed, 31 Jan 2018 07:07:58 +0100
Message-ID: <68659d33-37b2-60da-35df-45d0f98c1c06@suse.com>
References: <1517240291-32409-1-git-send-email-andrew.cooper3@citrix.com>
 <1517240291-32409-5-git-send-email-andrew.cooper3@citrix.com>
 <5A703D5602000078001A3A1B@prv-mh.provo.novell.com>
 <4fcd2069-5e5d-2bec-512a-86e04d83b669@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <4fcd2069-5e5d-2bec-512a-86e04d83b669@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: RossLagerwall <ross.lagerwall@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMDEvMTggMjA6MjYsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gSG93ZXZlciwgdGhlcmUg
aXMgbGl0ZXJhbGx5IG5vdGhpbmcgd2UgY2FuIGRvIHRvIHByZXZlbnQgI01DIGZyb20KPiBhcnJp
dmluZy7CoCBXZSBjYW4gc3RvcCBzZXJ2aWNpbmcgI01DIGJ5IGRpc2FibGluZyBDUjQuTUNFLCBi
dXQgdGhlbiB0aGUKPiBwcm9jZXNzb3Igd2lsbCBzaHV0IGRvd24uCgpIbW0sIHRoZXJlIGlzIGEg
d2F5IHRvIGF2b2lkICNNQyBvbiBvdGhlciBwcm9jZXNzb3JzLCBidXQgdGhpcwpyZXF1aXJlcyB0
aGUgcmVhbGx5IGJpZyBoYW1tZXI6IHN0b3AgYWxsIG90aGVyIGNwdXMgYW5kIHJlc3RhcnQKdGhl
bSBhZnRlciBwYXRjaGluZy4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
