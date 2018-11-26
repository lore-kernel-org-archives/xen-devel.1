From: "Woods, Brian" <Brian.Woods@amd.com>
Subject: Re: [PATCH 3/4] x86/msr: Handle MSR_TSC_AUX
 consistently for PV and HVM guests
Date: Mon, 26 Nov 2018 15:28:07 +0000
Message-ID: <20181126152803.GA28856@amd.com>
References: <1542318438-20319-1-git-send-email-andrew.cooper3@citrix.com>
 <1542318438-20319-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542318438-20319-4-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
Content-ID: <6E1B7B26D9C6E24185F69DE429870551@namprd12.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Xen-devel <xen-devel@lists.xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, "Woods,
 Brian" <Brian.Woods@amd.com>, "Suthikulpanit,
 Suravee" <Suravee.Suthikulpanit@amd.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMTUsIDIwMTggYXQgMDk6NDc6MTdQTSArMDAwMCwgQW5keSBDb29wZXIgd3Jv
dGU6Cj4gV2l0aCBQVlJEVFNDUCBtb2RlIHJlbW92ZWQsIGhhbmRsaW5nIG9mIE1TUl9UU0NfQVVY
IGNhbiBtb3ZlIGludG8gdGhlIGNvbW1vbgo+IGNvZGUuICBNb3ZlIGl0cyBzdG9yYWdlIGludG8g
c3RydWN0IHZjcHVfbXNycyAoZHJvcHBpbmcgdGhlIEhWTS1zcGVjaWZpYwo+IG1zcl90c2NfYXV4
KSwgYW5kIGFkZCBhbiBSRFBJRCBmZWF0dXJlIGNoZWNrIGFzIHRoaXMgYml0IGFsc28gZW51bWVy
YXRlcyB0aGUKPiBwcmVzZW5jZSBvZiB0aGUgTVNSLgo+IAo+IERyb3AgaHZtX21zcl90c2NfYXV4
KCkgZW50aXJlbHksIGFuZCB1c2Ugdi0+YXJjaC5tc3JzLT50c2NfYXV4IGRpcmVjdGx5Lgo+IFVw
ZGF0ZSBodm1fbG9hZF9jcHVfY3R4dCgpIHRvIGNoZWNrIHRoYXQgdGhlIGluY29taW5nIGN0eHQu
bXNyX3RzY19hdXggaXNuJ3QKPiBvdXQgb2YgcmFuZ2UuICBJbiBwcmFjdGljZSwgbm8gcHJldmlv
dXMgdmVyc2lvbiBvZiBYZW4gZXZlciB3cm90ZSBhbgo+IG91dC1vZi1yYW5nZSB2YWx1ZS4gIEFk
ZCBNU1JfVFNDX0FVWCB0byB0aGUgbGlzdCBvZiBNU1JzIG1pZ3JhdGVkIGZvciBQVgo+IGd1ZXN0
cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgoKQWNrZWQtYnk6IEJyaWFuIFdvb2RzIDxicmlhbi53b29kc0BhbWQuY29tPgoKLS0g
CkJyaWFuIFdvb2RzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
