From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/4] x86/vvmx: Don't call vmsucceed() at the
 end of virtual_vmexit()
Date: Thu, 15 Nov 2018 15:30:51 +0000
Message-ID: <ae3a9a54-7cb7-25fe-a12d-5f32fa4b267a@citrix.com>
References: <1542289970-32709-1-git-send-email-andrew.cooper3@citrix.com>
 <1542289970-32709-5-git-send-email-andrew.cooper3@citrix.com>
 <1210c5d3-2a61-1d66-4bf6-4e7e400829ec@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1210c5d3-2a61-1d66-4bf6-4e7e400829ec@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sergey Dyasli <sergey.dyasli@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMTEvMjAxOCAxNToyOCwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPiBPbiAxNS8xMS8yMDE4
IDEzOjUyLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBUaGlzIGVuZHMgdXAgY29ycnVwdGluZyBM
MSdzIHZpZXcgb2YgUkZMQUdTIGJ5IHNldHRpbmcgWkYuICBUaGUgY29ycmVjdCB2YWx1ZQo+PiBp
cyBlc3RhYmxpc2hlZCBlYXJsaWVyIGluIHRoZSBmdW5jdGlvbi4KPiB2bXN1Y2NlZWQoKSBkb2Vz
bid0IHNldCBhbnkgZmxhZ3MsIG9ubHkgY2xlYXJzIHNvbWUuIEFuZCBpbiB0aGlzIGZ1bmN0aW9u
IGl0J3MKPiBqdXN0IHJlZHVuZGFudC4gWkYgaXMgc2V0IGJ5IFZNZmFpbFZhbGlkLiBTbyBJIHRo
aW5rIHRoZSBkZXNjcmlwdGlvbiBtdXN0IGJlCj4gY2hhbmdlZC4KCk9oIC0gc28gaXQgZG9lcy7C
oCBZZXMgLSBJIHdhcyBjb25mdXNpbmcgaXQgd2l0aCB0aGUgZmFpbHZhbGlkIGNhc2UuwqAKSSds
bCBmaXggdGhlIHdvcmRpbmcgdG8gIlRoZSBjb3JyZWN0IFJGTEFHUyB2YWx1ZSBpcyBlc3RhYmxp
c2hlZCBlYXJsaWVyCmluIHRoZSBmdW5jdGlvbiwgYW5kIHRoaXMgY2FsbCBoYXMgbm8gbmV0IGVm
ZmVjdC4iCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
