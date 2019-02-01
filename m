From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.12] x86/svm: Fix handling of ICEBP
 intercepts
Date: Fri, 1 Feb 2019 15:56:11 +0100
Message-ID: <6c13cdff-2fef-3608-ad82-5504c695969f@suse.com>
References: <1549032559-9076-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1549032559-9076-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDIvMjAxOSAxNTo0OSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBjL3MgOTMzOGEzN2Qg
Ing4Ni9zdm06IGltcGxlbWVudCBkZWJ1ZyBldmVudHMiIGFkZGVkIHN1cHBvcnQgZm9yIGludHJv
c3BlY3RpbmcKPiBJQ0VCUCBkZWJ1ZyBleGNlcHRpb25zLCBidXQgZGlkbid0IGFjY291bnQgZm9y
IHRoZSBmYWN0IHRoYXQKPiBzdm1fZ2V0X2luc25fbGVuKCkgKHByZXZpb3VzbHkgX19nZXRfaW5z
dHJ1Y3Rpb25fbGVuZ3RoKSBjYW4gZmFpbCBhbmQgbWF5Cj4gYWxyZWFkeSByYWlzZSAjR1AgZm9y
IHRoZSBndWVzdC4KPiAKPiBJZiBzdm1fZ2V0X2luc25fbGVuKCkgZmFpbHMsIHJldHVybiBiYWNr
IHRvIGd1ZXN0IGNvbnRleHQgcmF0aGVyIHRoYW4KPiBjb250aW51aW5nIGFuZCBtaXN0YWtpbmcg
YSB0cmFwLXN0eWxlIFZNRXhpdCBmb3IgYSBmYXVsdC1zdHlsZSBvbmUuCj4gCj4gU3BvdHRlZCBi
eSBDb3Zlcml0eS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3Nz
QHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
