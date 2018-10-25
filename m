From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/4] x86/vvmx: XSA-278 followup fixes
Date: Thu, 25 Oct 2018 16:36:38 +0100
Message-ID: <1540481802-20037-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

SGVyZSBhcmUgc29tZSBvZiB0aGUgZWFzaWVyIGZpeGVzIGZvbGxvd2luZyBvbiBmcm9tIHRoZSBY
U0EtMjc4IGludmVzdGlnYXRpb24uClRoaXMgc2VyaWVzIHJlbW92ZXMgdGhlIGR1cGxpY2F0ZWQg
Y2hlY2tzIGxlZnQgb3ZlciBmcm9tIHRoZSBzZWN1cml0eSBmaXguICBJCmRpZCBoYXZlIHNvbWUg
ZnVydGhlciBwbGFucywgYnV0IHRoZSBlbWJhcmdvIGJyZWFraW5nIGVhcmx5IG1lYW5zIEkgaGF2
ZW4ndApoYWQgdGltZSB0byBnZXQgdGhlbSByZWFkeSBmb3IgcG9zdGluZy4KCkEgbG9uZ2VyIHRl
cm0gcGxhbiBpcyB0byBtb2RlbCBuZXN0ZWQgdmlydCBhcyBhbiBYODZfRU1VXyBmbGFnLCBidXQg
dGhhdApyZXF1aXJlcyBhIGZhaXIgYW1vdW50IG9mIHVudGFuZ2xpbmcgb2YgdmFyaW91cyB0b29s
c3RhY2sgYWN0aW9ucyBkdXJpbmcKY3JlYXRlIGFuZCBtaWdyYXRlLgoKQW5kcmV3IENvb3BlciAo
NCk6CiAgeDg2L3Z2bXg6IFVuY29uZGl0aW9uYWxseSBpbml0aWFsaXNlIHZteG9uX3JlZ2lvbl9w
YSBkdXJpbmcgdmNwdSBjb25zdHJ1Y3Rpb24KICB4ODYvdnZteDogRHJvcCB0aGUgbm93LW9ic29s
ZXRlIHZteF9pbnN0X2NoZWNrX3ByaXZpbGVnZSgpCiAgeDg2L3Z2bXg6IElOVlZQSUQgaW5zdHJ1
Y3Rpb25zIHNob3VsZCBiZSBoYW5kbGVkIGF0IGJ5IEwxCiAgeDg2L3Z2bXg6IERvbid0IGhhbmRs
ZSB1bmtub3duIG5lc3RlZCB2bWV4aXQgcmVhc29ucyBhdCBMMAoKIHhlbi9hcmNoL3g4Ni9odm0v
dm14L3ZteC5jICB8ICAyICsKIHhlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYyB8IDkwICsrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2Vk
LCAyNSBpbnNlcnRpb25zKCspLCA2NyBkZWxldGlvbnMoLSkKCi0tIAoyLjEuNAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
