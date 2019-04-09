From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH] x86/hvm: Fix altp2m_op hypercall
 continuations
Date: Tue, 9 Apr 2019 13:28:59 +0300
Message-ID: <927806db-95f8-c376-89b2-cac746a278eb@bitdefender.com>
References: <1554745146-4785-1-git-send-email-andrew.cooper3@citrix.com>
 <cee70772-2e84-a255-e4e7-889a1ef61075@bitdefender.com>
 <30745b36-777d-e146-fc39-22369e8ee91a@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <30745b36-777d-e146-fc39-22369e8ee91a@citrix.com>
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gNC84LzE5IDk6MzQgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMDgvMDQvMjAxOSAx
OToxMywgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+PiBUaGUgY2hhbmdlcyBjZXJ0YWlubHkgbG9v
ayBjb3JyZWN0LiBJJ2xsIHJ1biBzb21lIHRlc3RzIHRvbW9ycm93IGFzIHdlbGwuCj4gCj4gVGhh
bmtzLAoKQ29udGludWF0aW9uIGFwcGVhcnMgdG8gd29yayBjb3JyZWN0bHkgd2l0aCBvdXIgdGVz
dHMgKDY0LWJpdCBQViBkb21haW4gCmNhbGxpbmcgNjQtYml0IFhlbiAvIGRvbTApLiBTaW5jZSB3
ZSdyZSBvbmx5IHVzaW5nIHRoZSBleHRlcm5hbCBhbHRwMm0gCm1vZGVsLCBIVk1PUHMgZnJvbSBh
IDMyLWJpdCBndWVzdCBuZXZlciBvY2N1ciwgc28gdGhlIGlzc3VlcyB0aGlzIHBhdGNoIApmaXhl
cyBhcmUgbm90IGEgcHJvYmxlbSBmb3Igb3VyIGludHJvc3BlY3Rpb24gYWdlbnQsIGF0IGxlYXN0
LgoKClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
