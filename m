From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH 2/4] x86/altp2m: Rework #VE enable/disable
 paths
Date: Wed, 20 Feb 2019 01:10:14 +0200
Message-ID: <0f1a8d91-082a-fa3a-6c87-5689a6263d52@bitdefender.com>
References: <1550614715-21161-1-git-send-email-andrew.cooper3@citrix.com>
 <1550614715-21161-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1550614715-21161-3-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Juergen Gross <jgross@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMi8yMC8xOSAxMjoxOCBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBTcGxpdCBhbHRwMm1f
dmNwdV97ZW5hYmxlLGRpc2FibGV9X3ZlKCkgb3V0IG9mIHRoZQo+IEhWTU9QX2FsdHAybV92Y3B1
X3tlbmFibGUsZGlzYWJsZX1fbm90aWZ5IG1hcnNoYWxsaW5nIGxvZ2ljLiAgQSBmdXR1cmUgY2hh
bmdlCj4gaXMgZ29pbmcgdG8gbmVlZCB0byBjYWxsIGFsdHAybV92Y3B1X2Rpc2FibGVfdmUoKSBm
cm9tIHRoZSBkb21haW5fa2lsbCgpIHBhdGguCj4gCj4gV2hpbGUgYXQgaXQsIGNsZWFuIHVwIHRo
ZSBsb2dpYyBpbiBhbHRwMm1fdmNwdV97aW5pdGlhbGlzZSxkZXN0cm95fSgpLgo+IGFsdHAybV92
Y3B1X3Jlc2V0KCkgaGFzIG5vIGV4dGVybmFsIGNhbGxlcnMsIHNvIGZvbGQgaXQgaW50byBpdHMg
dHdvCj4gY2FsbHNpdGVzLiAgVGhpcyBpbiB0dXJuIGFsbG93cyBmb3IgYWx0cDJtX3ZjcHVfZGVz
dHJveSgpIHRvIHJldXNlCj4gYWx0cDJtX3ZjcHVfZGlzYWJsZV92ZSgpIHJhdGhlciB0aGFuIG9w
ZW5jb2RpbmcgaXQuCj4gCj4gTm8gcHJhY3RpY2FsIGNoYW5nZS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6
IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KCgpUaGFua3MsClJh
enZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
