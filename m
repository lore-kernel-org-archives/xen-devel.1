From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 10/20] xen/domctl: Merge set_max_evtchn into
 createdomain
Date: Wed, 21 Mar 2018 17:40:13 +0000
Message-ID: <20180321174013.djmpsgy2pw6v7jcg@citrix.com>
References: <1521486839-25617-1-git-send-email-andrew.cooper3@citrix.com>
 <1521486839-25617-11-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1521486839-25617-11-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>, Wei Liu <wei.liu2@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Jon Ludlam <jonathan.ludlam@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Christian Lindig <christian.lindig@citrix.com>, Jan Beulich <JBeulich@suse.com>, David Scott <dave@recoil.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXIgMTksIDIwMTggYXQgMDc6MTM6NDlQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBzZXRfbWF4X2V2dGNobiBpcyBzb21ld2hhdCB3ZWlyZC4gIEl0IHdhcyBpbnRyb2R1
Y2VkIHdpdGggdGhlIGV2ZW50X2ZpZm8gd29yaywKPiBidXQgaGFzIG5ldmVyIGJlZW4gdXNlZC4g
IFN0aWxsLCBpdCBpcyBhIGJvdW5kaW5nIG9uIHJlc291cmNlcyBjb25zdW1lZCBieSB0aGUKPiBl
dmVudCBjaGFubmVsIGluZnJhc3RydWN0dXJlLCBhbmQgc2hvdWxkIGJlIHBhcnQgb2YgY3JlYXRl
ZG9tYWluLCByYXRoZXIgdGhhbgo+IGVkaXRhYmxlIGFmdGVyIHRoZSBmYWN0Lgo+IAo+IERyb3Ag
WEVOX0RPTUNUTF9zZXRfbWF4X2V2dGNobiBjb21wbGV0ZWx5IChpbmNsdWRpbmcgWFNNIGhvb2tz
IGFuZCBsaWJ4Ywo+IHdyYXBwZXJzKSwgYW5kIHJldGFpbiB0aGUgZnVuY3Rpb25hbGl0eSBpbiBY
RU5fRE9NQ1RMX2NyZWF0ZWRvbWFpbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUy
QGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
