From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.11] x86: Use spec_ctrl_{enter,
 exit}_idle() in the S3/S5 path
Date: Thu, 19 Apr 2018 08:40:13 +0200
Message-ID: <440df13d-cced-2ebe-5e06-b8e6e33910e2@suse.com>
References: <1524048235-19493-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1524048235-19493-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDQvMTggMTI6NDMsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gVGhpcyBhdm9pZHMgb3Bl
bmNvZGluZyB0aGUgZnVuY3Rpb25hbGl0eSAoYW5kIG1pc3Npbmcgb25lIGJpdCBvZiBpdCksIGFu
ZCBhbmQKPiBzb21lIGNvbW1lbnRzIGV4cGxhaW5pbmcgd2hhdCBpcyBnb2luZyBvbi4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoK
UmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJn
ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
