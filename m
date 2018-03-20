From: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH 10/20] xen/domctl: Merge set_max_evtchn into
 createdomain
Date: Tue, 20 Mar 2018 15:27:05 -0400
Message-ID: <7abb49e7-59fb-e058-7269-9b1005e5db25@tycho.nsa.gov>
References: <1521486839-25617-1-git-send-email-andrew.cooper3@citrix.com>
 <1521486839-25617-11-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1521486839-25617-11-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Jon Ludlam <jonathan.ludlam@eu.citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>, Christian Lindig <christian.lindig@citrix.com>, Jan Beulich <JBeulich@suse.com>, David Scott <dave@recoil.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMTkvMjAxOCAwMzoxMyBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBzZXRfbWF4X2V2
dGNobiBpcyBzb21ld2hhdCB3ZWlyZC4gIEl0IHdhcyBpbnRyb2R1Y2VkIHdpdGggdGhlIGV2ZW50
X2ZpZm8gd29yaywKPiBidXQgaGFzIG5ldmVyIGJlZW4gdXNlZC4gIFN0aWxsLCBpdCBpcyBhIGJv
dW5kaW5nIG9uIHJlc291cmNlcyBjb25zdW1lZCBieSB0aGUKPiBldmVudCBjaGFubmVsIGluZnJh
c3RydWN0dXJlLCBhbmQgc2hvdWxkIGJlIHBhcnQgb2YgY3JlYXRlZG9tYWluLCByYXRoZXIgdGhh
bgo+IGVkaXRhYmxlIGFmdGVyIHRoZSBmYWN0Lgo+IAo+IERyb3AgWEVOX0RPTUNUTF9zZXRfbWF4
X2V2dGNobiBjb21wbGV0ZWx5IChpbmNsdWRpbmcgWFNNIGhvb2tzIGFuZCBsaWJ4Ywo+IHdyYXBw
ZXJzKSwgYW5kIHJldGFpbiB0aGUgZnVuY3Rpb25hbGl0eSBpbiBYRU5fRE9NQ1RMX2NyZWF0ZWRv
bWFpbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgoKQWNrZWQtYnk6IERhbmllbCBEZSBHcmFhZiA8ZGdkZWdyYUB0eWNoby5uc2Eu
Z292PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
