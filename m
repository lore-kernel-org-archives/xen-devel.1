Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C2BC531C9
	for <xen-devel@archiver.kernel.org>; Sat, 25 Jul 2026 09:49:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1370558.1618649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnZ0B-0003tk-6K; Sat, 25 Jul 2026 09:49:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1370558.1618649; Sat, 25 Jul 2026 09:49:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnZ0B-0003td-1n; Sat, 25 Jul 2026 09:49:03 +0000
Received: by outflank-mailman (input) for mailman id 1370558;
 Sat, 25 Jul 2026 09:49:01 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1wnZ09-0003sY-S9
 for xen-devel@lists.xenproject.org; Sat, 25 Jul 2026 09:49:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wnZ09-003Tyx-7s
 for xen-devel@lists.xenproject.org; Sat, 25 Jul 2026 11:49:01 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6a648665-bab6-0a2a0a5309dd-0a2a4505c29e-38
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jul 2026 11:49:00 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6a64868b-4cb1-0a2a45050019-aa0a817ce553-3
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jul 2026 11:49:00 +0200
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-659-kqW6JzhCMSGvGk6dV2OZ9Q-1; Sat,
 25 Jul 2026 05:48:55 -0400
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 57AE31944D07; Sat, 25 Jul 2026 09:48:53 +0000 (UTC)
Received: from localhost (unknown [10.44.22.7])
 by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id EC46B414; Sat, 25 Jul 2026 09:48:51 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784972939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o/K+1AUXVnWWVKlHiV4xOB2JHy4bJFnMoNAwKxtUWMM=;
	b=chmbcuKavWhVMwayB/STkMyWSNG9B/NRCDgyClqK13MIEr2ORg2Vf9Ucw7G3qaaCv9u21E
	u5DKq5Z0j5nznDqTE1Jkj3FWgjaVRNxY+giietIZ3kCN/QIEVIXOebJ5qKiSeRav0PTtWD
	5uuJNCL86E2iwetB53ZG9xTx0wpFKKc=
X-MC-Unique: kqW6JzhCMSGvGk6dV2OZ9Q-1
X-Mimecast-MFC-AGG-ID: kqW6JzhCMSGvGk6dV2OZ9Q_1784972934
From: =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Date: Sat, 25 Jul 2026 13:48:33 +0400
Subject: [PATCH v2 2/8] migration: fix qemu_get_counted_string annotation
MIME-Version: 1.0
Message-Id: <20260725-co-v2-2-d3552ddb3931@redhat.com>
References: <20260725-co-v2-0-d3552ddb3931@redhat.com>
In-Reply-To: <20260725-co-v2-0-d3552ddb3931@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>, 
 Fabiano Rosas <farosas@suse.de>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 John Snow <jsnow@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>, 
 Fam Zheng <fam@euphon.net>, "Denis V. Lunev" <den@openvz.org>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony PERARD <anthony@xenproject.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 xen-devel@lists.xenproject.org, Li Zhijian <lizhijian@fujitsu.com>, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=908;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=30QVK4Yftj1iMTz1RR+q67DvyJxcMY1WCMPrbYrInjc=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqZIZzO1HZBtKMLGFKp3fYeR5gHjF+rjEkFyuzI
 0CxABrBaD2JAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCamSGcwAKCRDa6OEJdZac
 5buBD/99haUzF1FiNgKLiFuyz6+SuHqBPF3MGW6my12xjC7Af9mOxeD9wqgASB6p8LNAqsfw3Rf
 8sJJdoEZP+Cv0/ykaAmcDhUJYjmRBCYhjsI0bkf6vgAPkQUl0LJZDuDLKYn/9i4Tpv+nEZ1F04f
 aVEEEdI68AMq7Hznot0B9b9LCG0tzzJrO2Y0OlXl49BqVhTGJ3fb/OSV2e5r1LMPCVJLK6vEJKf
 SyAZNyuB5XCSCIYfgFOcu7h4K6yRH75p++quoBFHKqHhIwEn3V1wBuVorxEGOQBEv9dgdVt2ZeI
 mjKwctY3vLgVWEzowRy1cdxFKeKs+u2t9v3tM8ZcpgTOqIcYxPFt/ecfCgpaQwCSdOYG5RNEoeR
 IydKsGfkRthqCPdjBjIc65krISlvtbM0PqljjyPgsELy0YGxPMICjJTzbovK53zMt69Swx3pGBK
 CoEeriygam9HZnbKjwC6KEVYteJUdDxzVgqR9XLiIPptHVCrlaLBVr8VVY9Wl+jgzpyV29b5sTx
 0Ognto50yvAnke/1swfgvGt0dpELPO6ot5n7j76wu9ChnaojU4w19Vw7rAENuBpDxuBkWqNNdWP
 Whc6clSymH5W8Or2yeUJIoTkN8fzfPh95eYWo6c0y8KFzuQrm1ArZtB07s2K7zqnedCRJn082RD
 fjk5NV58LBo2agA==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: _CxpeqU77fgEpA5yZTkwu1TmUMQmUJcVWmOF8AYkAVw_1784972934
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1784972940-F4CA02A1-F07167EA/0/0
X-purgate-type: clean
X-purgate-size: 910

Fixes: 394b9407e4c ("migration: mark mixed functions that can suspend")
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 migration/qemu-file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index d5a48115bd63..f30e13c66d77 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -830,7 +830,7 @@ uint64_t qemu_get_be64(QEMUFile *f)
  *          else 0
  *          (Note a 0 length string will return 0 either way)
  */
-size_t coroutine_fn qemu_get_counted_string(QEMUFile *f, char buf[256])
+size_t coroutine_mixed_fn qemu_get_counted_string(QEMUFile *f, char buf[256])
 {
     size_t len = qemu_get_byte(f);
     size_t res = qemu_get_buffer(f, (uint8_t *)buf, len);

-- 
2.55.0


